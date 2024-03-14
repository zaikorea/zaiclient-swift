import Foundation

public class AddPageViewEvent: EventRequest {
    private let defaultEventType: String = "page_view"
    private let defaultItemId: String = "null"
    
    public required init(userId: String, pageType: String, timestamp: Double = Date().timeIntervalSince1970, containsZaiRec: Bool = false) throws {
        try super.init(userId: userId, itemIds: [defaultItemId], superEventType: defaultEventType, superEventValues: [pageType], timestamp: timestamp, superFroms: [""], superIsZaiRecs: [containsZaiRec])
    }
}
