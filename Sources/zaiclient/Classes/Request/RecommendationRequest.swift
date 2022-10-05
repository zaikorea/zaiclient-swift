import Foundation

public class RecommendationRequest: Encodable {
    
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
            if !(1...100).contains(_userId.count) {
                throw ZaiError.InvalidUserId
            }
        }
        if let _itemId = itemId {
            if !(1...100).contains(_itemId.count) {
                throw ZaiError.InvalidItemId
            }
        }
        if let _itemIds = itemIds {
            if !(1...1_000_000).contains(_itemIds.count) {
                throw ZaiError.InvalidItemIds
            }
            for id in _itemIds {
                if !(1...100).contains(id.count) {
                    throw ZaiError.InvalidItemId
                }
            }
        }
        if !(1...1_000_000).contains(limit) {
            throw ZaiError.InvalidLimit
        }
        if !(0...1_000_000).contains(offset) {
            throw ZaiError.InvalidOffset
        }
        if !(1...100).contains(recommendationType.count) {
            throw ZaiError.InvalidRecommendationType
        }
        if let _options = options {
            if !(0...1000).contains(_options.count) {
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
    }
    
    public func getPathPrefix() -> String {
        return ""
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
