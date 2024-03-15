import Foundation

public class GetUserRecommendation: RecommendationRequest {

    public required init(userId: String?, limit: Int, offset: Int = 0, recommendationType: String = "homepage", options: [String: String]? = nil) throws {
        try super.init(userId: userId, limit: limit, offset: offset, recommendationType: recommendationType, options: options?.toJSONString())
    }
    
    override func getPath(clientId: String) -> String {
        let mlApiPathPrefix = String.init(format: Config.mlApiPathPrefix, clientId)
        return "\(mlApiPathPrefix)\(Config.userRecommendationPathPrefix)"
    }
}
