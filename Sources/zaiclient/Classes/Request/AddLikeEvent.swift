import Foundation

public class AddLikeEvent: EventRequest {
    private let defaultEventType: String = "like"
    private let defaultEventValue: String = "null"

    public required init(userId: String, itemId: String, timestamp: Double = Date().timeIntervalSince1970, from: String = "", isZaiRec: Bool = false) throws {
        try super.init(userId: userId, itemIds: [itemId], superEventType: defaultEventType, superEventValues: [defaultEventValue], timestamp: timestamp, superFroms: [from], superIsZaiRecs: [isZaiRec])
    }
}
