import Foundation

public class GetRelatedItemsRecommendation: RecommendationRequest {

    public required init(itemId: String, limit: Int, offset: Int = 0, recommendationType: String = "product_detail_page", options: [String: String]? = nil) throws {
        try super.init(itemId: itemId, limit: limit, offset: offset, recommendationType: recommendationType, options: options?.toJSONString())
    }
    
    override func getPath(clientId: String) -> String {
        let mlApiPathPrefix = String.init(format: Config.mlApiPathPrefix, clientId)
        return "\(mlApiPathPrefix)\(Config.relatedItemsRecommendationPathPrefix)"
    }
}
