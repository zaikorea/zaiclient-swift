import Foundation

public class Event: Encodable {
    public var userId: String
    public var itemId: String
    public var timestamp: Double
    public var eventType: String
    public var eventValue: String
    
    enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case itemId = "item_id"
            case timestamp = "timestamp"
            case eventType = "event_type"
            case eventValue = "event_value"
    }
    
    init(userId: String, itemId: String, timestamp: Double, eventType: String, eventValue: String) {
        self.userId = userId
        self.itemId = itemId
        self.timestamp = timestamp
        self.eventType = eventType
        self.eventValue = eventValue
    }
}

