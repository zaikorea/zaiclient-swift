import Foundation

public class CustomEvent: BaseEvent {
    
    public required init(userId: String, itemIds: [String], eventType: String, eventValues: [String], timestamp: Double = Date().timeIntervalSince1970) throws {
        
        if itemIds.count != eventValues.count {
            throw ZaiError.InputLengthNotEqual
        }
        
        try super.init(userId: userId, itemIds: itemIds, superEventType: eventType, superEventValues: eventValues, timestamp: timestamp)
    }
    
    public convenience init(userId: String, itemId: String, eventType: String, eventValue: String, timestamp: Double = Date().timeIntervalSince1970) throws {
        try self.init(userId: userId, itemIds: [itemId], eventType: eventType, eventValues: [eventValue], timestamp: timestamp)
    }
    
}
