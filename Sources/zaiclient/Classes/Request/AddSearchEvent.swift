import Foundation

public class AddSearchEvent: EventRequest {
    private let defaultItemId: String = "null"
    private let defaultEventType: String = "search"

    public required init(userId: String, searchQuery: String, timestamp: Double = Date().timeIntervalSince1970, isZaiRec: Bool = false) throws {
        try super.init(userId: userId, itemIds: [defaultItemId], superEventType: defaultEventType, superEventValues: [searchQuery], timestamp: timestamp, superFroms: [""], superIsZaiRecs: [isZaiRec])
    }
}
