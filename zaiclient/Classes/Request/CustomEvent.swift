import Foundation

public class CustomEvent: BaseEvent {
    
    public required init(userId: String, itemIds: [String], customEventType: String, customEventValues: [String], timestamp: Double = Date().timeIntervalSince1970) throws {
        
        if itemIds.count != customEventValues.count {
            throw ZaiError.InputLengthNotEqual
        }
        
        try super.init(userId: userId, itemIds: itemIds, eventType: customEventType, eventValues: customEventValues, timestamp: timestamp)
    }
    
    public convenience init(userId: String, itemId: String, customEventType: String, customEventValue: String, timestamp: Double = Date().timeIntervalSince1970) throws {
        try self.init(userId: userId, itemIds: [itemId], customEventType: customEventType, customEventValues: [customEventValue], timestamp: timestamp)
    }
    
}
