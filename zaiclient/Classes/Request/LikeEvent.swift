import Foundation

public class LikeEvent: BaseEvent {
    private let defaultEventType: String = "like"
    private let defaultEventValue: String = "null"

    public required init(userId: String, itemId: String, timestamp: Double = Date().timeIntervalSince1970) throws {
        try super.init(userId: userId, itemIds: [itemId], eventType: defaultEventType, eventValues: [defaultEventValue], timestamp: timestamp)
    }
}
