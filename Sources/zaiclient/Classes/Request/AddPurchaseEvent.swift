import Foundation

public class AddPurchaseEvent: EventRequest {
    private let defaultEventType: String = "purchase"

    public required init(userId: String, itemIds: [String], prices: [Int], timestamp: Double = Date().timeIntervalSince1970, isZaiRec: [Bool]? = nil) throws {
        
        if itemIds.count != prices.count {
            throw ZaiError.InputLengthNotEqual
        }
        
        let _isZaiRec: [Bool] = isZaiRec ?? [Bool](repeating: false, count: itemIds.count)
        
        try super.init(userId: userId, itemIds: itemIds, superEventType: defaultEventType, superEventValues: prices.map {String($0)}, timestamp: timestamp, superFroms: [String](repeating: "", count: itemIds.count), superIsZaiRecs: _isZaiRec)
    }
    
    public convenience init(userId: String, itemId: String, price: Int, timestamp: Double = Date().timeIntervalSince1970, isZaiRec: Bool = false) throws {
        try self.init(userId: userId, itemIds: [itemId], prices: [price], timestamp: timestamp, isZaiRec: [isZaiRec])
    }
}
