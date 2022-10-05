import Foundation

public class RelatedItemsRecommendationRequest: RecommendationRequest {

    public required init(itemId: String, limit: Int, offset: Int = 0, recommendationType: String = "product_detail_page", options: [String: String]? = nil) throws {
        try super.init(itemId: itemId, limit: limit, offset: offset, recommendationType: recommendationType, options: options?.toJSONString())
    }
    
    override public func getPathPrefix() -> String {
        return Config.relatedItemsRecommendationPathPrefix
    }
}
