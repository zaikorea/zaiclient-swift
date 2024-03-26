import Foundation


public class Event: Codable {
    public var userId: String
    public var itemId: String
    public var timestamp: Double
    public var eventType: String
    public var eventValue: String
    public var timeToLive: Int? = nil
    public var isZaiRec: Bool = false
    public var from: String? = nil
    public var url: String? = nil
    public var ref: String? = nil
    public var recommendationId: String? = nil
    public var eventProperties: [String: String]? = nil
    public var userProperties: [String: String]? = nil
    
    enum CodingKeys: String,
        CodingKey {
            case userId = "user_id"
            case itemId = "item_id"
            case timestamp = "timestamp"
            case eventType = "event_type"
            case eventValue = "event_value"
            case timeToLive = "time_to_live"
            case isZaiRec = "is_zai_recommendation"
            case from = "from"
            case url = "url"
            case ref = "ref"
            case recommendationId = "recommendation_id"
            case eventProperties = "event_properties"
            case userProperties = "user_properties"
    }
    
    init(
        userId: String,
        itemId: String,
        timestamp: Double,
        eventType: String,
        eventValue: String,
        timeToLive: Int?,
        isZaiRec: Bool,
        from: String?,
        url: String?,
        ref: String?,
        recommendationId: String?,
        eventProperties: [String: String]?,
        userProperties: [String: String]?
    ) {
        self.userId = userId
        self.itemId = itemId
        self.timestamp = timestamp
        self.eventType = eventType
        self.eventValue = eventValue
        self.timeToLive = timeToLive
        self.isZaiRec = isZaiRec
        self.from = from
        self.url = url
        self.ref = ref
        self.recommendationId = recommendationId
        self.eventProperties = eventProperties
        self.userProperties = userProperties
    }
}

extension Event: CustomStringConvertible {
    public var description: String {
        var properties = [
            "userId: \(userId)",
            "itemId: \(itemId)",
            "timestamp: \(timestamp)",
            "eventType: \(eventType)",
            "eventValue: \(eventValue)",
            "timeToLive: \(String(describing: timeToLive))",
            "isZaiRec: \(isZaiRec)"
        ]
        
        if let from = from {
            properties.append("from: \(from)")
        }
        if let url = url {
            properties.append("url: \(url)")
        }
        if let ref = ref {
            properties.append("ref: \(ref)")
        }
        if let recommendationId = recommendationId {
            properties.append("recommendationId: \(recommendationId)")
        }
        
        let eventPropertiesDescription = eventProperties?.map { "\($0.key): \($0.value)" }.joined(separator: ", ") ?? "nil"
        if (eventPropertiesDescription.count > 0) {
            properties.append("eventProperties: \(eventPropertiesDescription)")
        } else {
            properties.append("eventProperties: \([:])")
        }
        
        
        let userPropertiesDescription = userProperties?.map { "\($0.key): \($0.value)" }.joined(separator: ", ") ?? "nil"
        if (userPropertiesDescription.count > 0) {
            properties.append("userProperties: \(userPropertiesDescription)")
        } else {
            properties.append("userProperties: \([:])")
        }
        
        return properties.joined(separator: "\n")
    }
}
