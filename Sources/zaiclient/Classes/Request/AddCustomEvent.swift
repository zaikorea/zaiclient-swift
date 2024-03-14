import Foundation

public class AddCustomEvent: EventRequest {
    
    public required init(userId: String, itemIds: [String], eventType: String, eventValues: [String], timestamp: Double = Date().timeIntervalSince1970, from: [String]? = nil, isZaiRec: [Bool]? = nil) throws {
        
        if itemIds.count != eventValues.count {
            throw ZaiError.InputLengthNotEqual
        }
        
        let _from: [String] = from ?? [String](repeating: "", count: itemIds.count)
        let _isZaiRec: [Bool] = isZaiRec ?? [Bool](repeating: false, count: itemIds.count)

        try super.init(userId: userId, itemIds: itemIds, superEventType: eventType, superEventValues: eventValues, timestamp: timestamp, superFroms: _from, superIsZaiRecs: _isZaiRec)
    }
    
    public convenience init(userId: String, itemId: String, eventType: String, eventValue: String, timestamp: Double = Date().timeIntervalSince1970, from: String = "", isZaiRec: Bool = false) throws {
        try self.init(userId: userId, itemIds: [itemId], eventType: eventType, eventValues: [eventValue], timestamp: timestamp, from: [from], isZaiRec: [isZaiRec])
    }
    
}
