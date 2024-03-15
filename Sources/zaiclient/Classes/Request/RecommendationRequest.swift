import Foundation

public class RecommendationRequest: Request, Encodable {
    
    public var userId: String?
    public var itemId: String?
    public var itemIds: [String]?
    public var limit: Int
    public var offset: Int
    public var recommendationType: String
    public var options: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case itemId = "item_id"
        case itemIds = "item_ids"
        case limit = "limit"
        case offset = "offset"
        case recommendationType = "recommendation_type"
        case options = "options"
    }
    
    init(userId: String? = nil, itemId: String? = nil, itemIds: [String]? = nil, limit: Int, offset: Int, recommendationType: String, options: String? = nil) throws {
        if let _userId = userId {
            guard (1...500).contains(_userId.count) else {
                throw ZaiError.InvalidUserId
            }
        }
        if let _itemId = itemId {
            guard (1...500).contains(_itemId.count) else {
                throw ZaiError.InvalidItemId
            }
        }
        if let _itemIds = itemIds {
            guard (0...10_000).contains(_itemIds.count) else {
                throw ZaiError.InvalidItemIds
            }
            for id in _itemIds {
                guard (1...500).contains(id.count) else {
                    throw ZaiError.InvalidItemId
                }
            }
        }
        guard (0...10_000).contains(limit) else {
            throw ZaiError.InvalidLimit
        }
        guard (0...10_000).contains(offset) else {
            throw ZaiError.InvalidOffset
        }
        guard (1...500).contains(recommendationType.count) else {
            throw ZaiError.InvalidRecommendationType
        }
        if let _options = options {
            guard (0...1000).contains(_options.count) else {
                throw ZaiError.InvalidOptions
            }
        }
        
        self.userId = userId
        self.itemId = itemId
        self.itemIds = itemIds
        self.limit = limit
        self.offset = offset
        self.recommendationType = recommendationType
        self.options = options
        
        super.init(method: .post, baseUrl: Config.mlApiEndPoint)
    }
}

extension Dictionary {
    func toJSONString() -> String? {
        let jsonData = try? JSONSerialization.data(withJSONObject: self, options: [])
        guard jsonData != nil else {return nil}
        let jsonString = String(data: jsonData!, encoding: .utf8)
        guard jsonString != nil else {return nil}
        return jsonString! as String
    }
}
