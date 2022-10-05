import Foundation


public class PurchaseEvent: BaseEvent {
    private let defaultEventType: String = "purchase"

    public required init(userId: String, itemIds: [String], prices: [Int], timestamp: Double = Date().timeIntervalSince1970) throws {
        
        if itemIds.count != prices.count {
            throw ZaiError.InputLengthNotEqual
        }
        
        try super.init(userId: userId, itemIds: itemIds, superEventType: defaultEventType, superEventValues: prices.map {String($0)}, timestamp: timestamp)
    }
    
    public convenience init(userId: String, itemId: String, price: Int, timestamp: Double = Date().timeIntervalSince1970) throws {
        try self.init(userId: userId, itemIds: [itemId], prices: [price], timestamp: timestamp)
    }
}
