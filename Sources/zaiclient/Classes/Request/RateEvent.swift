import Foundation


public class RateEvent: BaseEvent {
    private let defaultEventType: String = "rate"
    
    public required init(userId: String, itemId: String, rating: Double, timestamp: Double = Date().timeIntervalSince1970) throws {
        try super.init(userId: userId, itemIds: [itemId], superEventType: defaultEventType, superEventValues: [String(rating)], timestamp: timestamp)
    }
}
