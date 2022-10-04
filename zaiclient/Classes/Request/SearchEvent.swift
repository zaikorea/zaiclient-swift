import Foundation

public class SearchEvent: BaseEvent {
    private let defaultItemId: String = "null"
    private let defaultEventType: String = "search"

    public required init(userId: String, searchQuery: String, timestamp: Double = Date().timeIntervalSince1970) throws {
        try super.init(userId: userId, itemIds: [defaultItemId], eventType: defaultEventType, eventValues: [searchQuery], timestamp: timestamp)
    }
}
