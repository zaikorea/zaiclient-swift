import Foundation

public struct Config {
    public static let eventsApiEndPoint: String = "https://collector-api%@.zaikorea.org"
    public static let eventsApiPath: String = "/events"
    
    public static let mlApiEndPoint: String = "https://ml-api%@.zaikorea.org"
    public static let mlApiPathPrefix: String = "/clients/%@/recommenders"
    public static let userRecommendationPathPrefix: String = "/user-recommendations"
    public static let relatedItemsRecommendationPathPrefix: String = "/related-items"
    public static let rerankingRecommendationPathPrefix: String = "/reranking"
    
    public static let hmacScheme: String = "ZAi"
    public static let zaiClientIdHeader: String = "X-ZAI-CLIENT-ID"
    public static let zaiUnixTimestampHeader: String = "X-ZAI-TIMESTAMP"
    public static let zaiAuthorizationHeader: String = "X-ZAI-AUTHORIZATION"
    public static let zaiCallTypeHeader: String = "X-ZAI-CALL-TYPE"
    public static let zaiCallType: String = "sdk_call"
    
    public static let batchRequestCap: Int = 50
    public static let epsilon: Double = 1e-4
    
    public static let timeout: Double = 60
}
