import Foundation

public class PageViewEvent: BaseEvent {
    private let defaultEventType: String = "page_view"
    private let defaultItemId: String = "null"
    
    public required init(userId: String, pageType: String, timestamp: Double = Date().timeIntervalSince1970) throws {
        try super.init(userId: userId, itemIds: [defaultItemId], eventType: defaultEventType, eventValues: [pageType], timestamp: timestamp)
    }
}
