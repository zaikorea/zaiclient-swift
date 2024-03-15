import Foundation

public class GetRerankingRecommendation: RecommendationRequest {

    public required init(userId: String?, itemIds: [String], limit: Int? = nil, offset: Int = 0, recommendationType: String = "category_page", options: [String: String]? = nil) throws {
        let _limit = limit ?? itemIds.count
        try super.init(userId: userId, itemIds: itemIds, limit: _limit, offset: offset, recommendationType: recommendationType, options: options?.toJSONString())
    }
    
    override func getPath(clientId: String) -> String {
        let mlApiPathPrefix = String.init(format: Config.mlApiPathPrefix, clientId)
        return "\(mlApiPathPrefix)\(Config.rerankingRecommendationPathPrefix)"
    }
}
