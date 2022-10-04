import Foundation
import CommonCrypto
import Alamofire

extension DataProtocol {
    var hexa: String { map { .init(format: "%02x", $0) }.joined() }
}

extension String {
    
    func hmacSHA256(key: String) -> String {
        
        let cKey = key.cString(using: String.Encoding.utf8)
        let cData = self.cString(using: String.Encoding.utf8)
        let digestLen = Int(CC_SHA256_DIGEST_LENGTH)
        var result = [CUnsignedChar](repeating: 0, count: digestLen)
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA256), cKey!, strlen(cKey!), cData!, strlen(cData!), &result)
        let hmacData:Data = Data(bytes: result, count: digestLen)
        let hmacHex = hmacData.hexa
        
        return hmacHex
    }
}

private func hmacSign(zaiSecret: String, path: String, timestamp: String) -> String {
    let message = "\(path):\(timestamp)"
    let signature = message.hmacSHA256(key: zaiSecret)
    
    return signature
}

public func generateZAiHeaders(zaiClientID: String, zaiSecret: String, path: String) -> HTTPHeaders {
    let timestamp = String(Int(Date().timeIntervalSince1970))
    let hmac = hmacSign(zaiSecret: zaiSecret, path: path, timestamp: timestamp)
    
    let zaiHeaders: HTTPHeaders = [
        Config.zaiClientIdHeader: zaiClientID,
        Config.zaiUnixTimestampHeader: timestamp,
        Config.zaiAuthorizationHeader: "\(Config.hmacScheme) \(hmac)"
    ]
    
    return zaiHeaders
}
