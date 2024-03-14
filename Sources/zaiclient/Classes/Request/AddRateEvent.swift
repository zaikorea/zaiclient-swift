import Foundation


public class AddRateEvent: EventRequest {
    private let defaultEventType: String = "rate"
    
    public required init(userId: String, itemId: String, rating: Double, timestamp: Double = Date().timeIntervalSince1970, isZaiRec: Bool = false) throws {
        try super.init(userId: userId, itemIds: [itemId], superEventType: defaultEventType, superEventValues: [String(rating)], timestamp: timestamp, superFroms: [""], superIsZaiRecs: [isZaiRec])
    }
}
