import Foundation

public class UserRecommendationRequest: RecommendationRequest {

    public required init(userId: String?, limit: Int, offset: Int = 0, recommendationType: String = "homepage", options: [String: String]? = nil) throws {
        try super.init(userId: userId, limit: limit, offset: offset, recommendationType: recommendationType, options: options?.toJSONString())
    }
    
    override public func getPathPrefix() -> String {
        return Config.userRecommendationPathPrefix
    }
}
