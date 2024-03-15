import Foundation
import Alamofire

public class ZaiClient {
    var _zaiClientID: String
    var _zaiSecret: String
    var _timeout: Double
    var _sessionManager: Alamofire.Session
    var _customEndpoint: String

    public init(zaiClientID: String, zaiSecret: String, timeout: Double = Config.timeout, customEndpoint: String = "") throws {
        self._zaiClientID = zaiClientID
        self._zaiSecret = zaiSecret
        self._timeout = timeout
        self._sessionManager = Alamofire.Session.default
        _sessionManager.session.configuration.timeoutIntervalForRequest = self._timeout > 0 ? self._timeout : Config.timeout
        
        guard let _ = customEndpoint.range(of: "^[a-zA-Z0-9-]*$", options: .regularExpression) else {
            throw ZaiError.InvalidCustomEndpoint
        }
        
        guard (0...100).contains(customEndpoint.count) else {
            throw ZaiError.InvalidCustomEndpoint
        }
        self._customEndpoint = customEndpoint
    }

    private func _processBaseUrl(baseUrl: String) -> String {
        let postfix = self._customEndpoint == "" ? "" : "-\(self._customEndpoint)"
        return String.init(format: baseUrl, postfix)
    }
    
    private func _sendRequest<D: Encodable, R: Decodable>(_ type: R.Type, method: HTTPMethod, baseUrl: String, path: String, payload: D, params: Parameters = [:], completionHandler: @escaping (_ response: R?,_ error: ZaiError.ClientError?) -> ()) {

        let processedBaseUrl = self._processBaseUrl(baseUrl: baseUrl)
        let zaiHeaders = generateZAiHeaders(zaiClientID: self._zaiClientID, zaiSecret: self._zaiSecret, path: path)
        
        let request = (params.isEmpty) ?
                self._sessionManager.request("\(processedBaseUrl)\(path)", method: method, parameters: payload, encoder: JSONParameterEncoder.default, headers: zaiHeaders) :
                self._sessionManager.request("\(processedBaseUrl)\(path)", method: method, parameters: params, encoding: URLEncoding(arrayEncoding: .noBrackets), headers: zaiHeaders)

        request
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
                if let d = response.data {
                    completionHandler(nil, ZaiError.ClientError(message: String(data: d, encoding: .utf8), httpStatusCode: response.response?.statusCode))
                } else {
                    completionHandler(nil, ZaiError.ClientError(message: ZaiError.NetworkError.errorDescription, httpStatusCode: response.response?.statusCode))
                }
            }
        }
    }

    public func sendRequest(_ request: EventRequest, isTest: Bool = false, completionHandler: @escaping (EventLoggerResponse?, ZaiError.ClientError?) -> () = { _,_  in }) {
         let payload = request.getPayload(isTest: isTest)
         
         if payload.count == 1 {
             _sendRequest(EventLoggerResponse.self, method: request.method, baseUrl: request.baseUrl, path: request.getPath(clientId: self._zaiClientID), payload: payload[0], completionHandler: completionHandler)
         } else {
             _sendRequest(EventLoggerResponse.self, method: request.method, baseUrl: request.baseUrl, path: request.getPath(clientId: self._zaiClientID), payload: payload, completionHandler: completionHandler)
         }
    }
    
    public func sendRequest(_ request: RecommendationRequest, completionHandler: @escaping (RecommendationResponse?, ZaiError.ClientError?) -> () = { _,_  in }) {
        _sendRequest(RecommendationResponse.self, method: request.method, baseUrl: request.baseUrl, path: request.getPath(clientId: self._zaiClientID), payload: request, completionHandler: completionHandler)
    }
    
    // public func sendRequest(_ request: ItemRequest, completionHandler: @escaping (ItemResponse?, ZaiError.ClientError?) -> () = { _,_  in }) {
    //     if (request.self is DeleteItem) {
    //         _sendRequest(ItemResponse.self, method: request.method, baseUrl: request.baseUrl, path: request.getPath(clientId: self._zaiClientID), payload: request, params: request.getQueryParam(), completionHandler: completionHandler)
    //     } else {
    //         _sendRequest(ItemResponse.self, method: request.method, baseUrl: request.baseUrl, path: request.getPath(clientId: self._zaiClientID), payload: request, completionHandler: completionHandler)
    //     }
    // }
    
    // public func sendRequest(_ requests: [ItemRequest], completionHandler: @escaping (ItemResponse?, ZaiError.ClientError?) -> () = { _,_  in }) {

    //     if requests.count > Config.batchRequestCap {
    //         return completionHandler(nil, ZaiError.ClientError(message: "The number of items in batch exceeded the size limit."))
    //     }
        
    //     if (!requests.allSatisfy({ type(of: $0) == type(of: requests[0])})) {
    //         return completionHandler(nil, ZaiError.ClientError(message: "The instance type of input is not the same."))
    //     }
        
    //     if (requests[0].self is DeleteItem) {
    //         var params = [String : [Any]]()
    //         for req in requests {
    //             for (key, value) in req.getQueryParam() {
    //                 params[key, default: []].append(value)
    //             }
    //         }
    //         _sendRequest(ItemResponse.self, method: requests[0].method, baseUrl: requests[0].baseUrl, path: requests[0].getPath(clientId: self._zaiClientID), payload: requests[0], params: params, completionHandler: completionHandler)
    //     } else {
    //         _sendRequest(ItemResponse.self, method: requests[0].method, baseUrl: requests[0].baseUrl, path: requests[0].getPath(clientId: self._zaiClientID), payload: requests, completionHandler: completionHandler)
    //     }
    // }
}

