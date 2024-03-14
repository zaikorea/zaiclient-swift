import Foundation
import Alamofire

open class Request {

    public var method: HTTPMethod
    public var baseUrl: String
    
    init(method: HTTPMethod, baseUrl: String) {
        self.method = method
        self.baseUrl = baseUrl
    }
    
    func getPath(clientId: String) -> String {
        return ""
    }
    
    func getPayload(isTest: Bool = false) -> [Event] {
        return []
    }
    
    func getQueryParam() -> Parameters {
        return [:]
    }
}
