import Foundation
import Alamofire

public class ZaiClient {
    var _zaiClientID: String
    var _zaiSecret: String
    var _timeout: Double
    var _sessionManager: Alamofire.Session
    var _mlApiEndpoint: String
    var _eventsApiEndpoint: String
    
    public init(zaiClientID: String, zaiSecret: String, timeout: Double = Config.timeout, customEndpoint: String = "") throws {
        self._zaiClientID = zaiClientID
        self._zaiSecret = zaiSecret
        self._timeout = timeout
        self._sessionManager = Alamofire.Session.default
        _sessionManager.session.configuration.timeoutIntervalForRequest = self._timeout > 0 ? self._timeout : Config.timeout
        
        guard let _ = customEndpoint.range(of: "^[a-zA-Z0-9-]*$", options: .regularExpression) else {
            throw ZaiError.InvalidCustomEndpoint
        }
        
        guard (0...10).contains(customEndpoint.count) else {
            throw ZaiError.InvalidCustomEndpoint
        }
        
        let _customEndpoint = customEndpoint == "" ? customEndpoint : "-\(customEndpoint)"
        self._mlApiEndpoint = String.init(format: Config.mlApiEndPoint, _customEndpoint)
        self._eventsApiEndpoint = String.init(format: Config.eventsApiEndPoint, _customEndpoint)
    }
    
    private func sendRequest<D: Encodable, R: Decodable>(_ type: R.Type, method: HTTPMethod, url: String, payload: D, headers: HTTPHeaders, completionHandler: @escaping (_ response: R?,_ error: ZaiError.ClientError?) -> ()) {
        
        self._sessionManager.request(url, method: method, parameters: payload, encoder: JSONParameterEncoder.default, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in switch response.result {
            case .success(let obj):
                do {
                    let getData = try JSONDecoder().decode(R.self, from: obj)
                    completionHandler(getData, nil)
                } catch {
                    completionHandler(nil, error as? ZaiError.ClientError)
                }
            case .failure:
                completionHandler(nil, ZaiError.ClientError(message: String(data: response.data!, encoding: .utf8), httpStatusCode: response.response?.statusCode))
            }
        }
    }
    
    public func addEventLog(_ event: BaseEvent, completionHandler: @escaping (EventLoggerResponse?, ZaiError.ClientError?) -> () = { _,_  in }) {
        let url = "\(self._eventsApiEndpoint)\(Config.eventsApiPath)"
        var zaiHeaders = generateZAiHeaders(zaiClientID: self._zaiClientID, zaiSecret: self._zaiSecret, path: Config.eventsApiPath)
        zaiHeaders.add(HTTPHeader(name: Config.zaiCallTypeHeader, value: Config.zaiCallType))
        let payload = event.getPayload()
        
        if payload.count == 1 {
            sendRequest(EventLoggerResponse.self, method: .post, url: url, payload: payload[0], headers: zaiHeaders, completionHandler: completionHandler)
        } else {
            sendRequest(EventLoggerResponse.self, method: .post, url: url, payload: payload, headers: zaiHeaders, completionHandler: completionHandler)
        }
    }
    
    public func updateEventLog(_ event: BaseEvent, completionHandler: @escaping (EventLoggerResponse?, ZaiError.ClientError?) -> () = { _,_  in }) throws {
        let url = "\(self._eventsApiEndpoint)\(Config.eventsApiPath)"
        var zaiHeaders = generateZAiHeaders(zaiClientID: self._zaiClientID, zaiSecret: self._zaiSecret, path: Config.eventsApiPath)
        zaiHeaders.add(HTTPHeader(name: Config.zaiCallTypeHeader, value: Config.zaiCallType))
        let payload = event.getPayload()
        
        if payload.count > 1 {
            throw ZaiError.BatchUpdateForbidden
        }
        sendRequest(EventLoggerResponse.self, method: .put, url: url, payload: payload[0], headers: zaiHeaders, completionHandler: completionHandler)
    }

    public func deleteEventLog(_ event: BaseEvent, completionHandler: @escaping (EventLoggerResponse?, ZaiError.ClientError?) -> () = { _,_  in }) {
        let url = "\(self._eventsApiEndpoint)\(Config.eventsApiPath)"
        var zaiHeaders = generateZAiHeaders(zaiClientID: self._zaiClientID, zaiSecret: self._zaiSecret, path: Config.eventsApiPath)
        zaiHeaders.add(HTTPHeader(name: Config.zaiCallTypeHeader, value: Config.zaiCallType))
        let payload = event.getPayload()

        if payload.count == 1 {
            sendRequest(EventLoggerResponse.self, method: .delete, url: url, payload: payload[0], headers: zaiHeaders, completionHandler: completionHandler)
        } else {
            sendRequest(EventLoggerResponse.self, method: .delete, url: url, payload: payload, headers: zaiHeaders, completionHandler: completionHandler)
        }
    }

    public func getRecommendations(_ recommendation: RecommendationRequest, completionHandler: @escaping (RecommendationResponse?, ZaiError.ClientError?) -> ()) {
        let mlApiPathPrefix = String.init(format: Config.mlApiPathPrefix, self._zaiClientID)
        let url = "\(self._mlApiEndpoint)\(mlApiPathPrefix)\(recommendation.getPathPrefix())"
        let zaiHeaders = generateZAiHeaders(zaiClientID: self._zaiClientID, zaiSecret: self._zaiSecret, path: "\(mlApiPathPrefix)\(recommendation.getPathPrefix())")

        sendRequest(RecommendationResponse.self, method: .post, url: url, payload: recommendation, headers: zaiHeaders, completionHandler: completionHandler)
    }
}
