import Foundation

open class BaseEvent {

    public var timestamp: Double
    private var payload: [Event]
    
    init(userId: String, itemIds: [String], superEventType: String, superEventValues: [String], timestamp: Double) throws {
        // Input validation
        guard (1...500).contains(userId.count) else {
            throw ZaiError.InvalidUserId
        }
        for itemId in itemIds {
            guard (1...500).contains(itemId.count) else {
                throw ZaiError.InvalidItemId
            }
        }
        guard (1...500).contains(superEventType.count) else {
            throw ZaiError.InvalidEventType
        }
        for eventValue in superEventValues {
            guard (1...).contains(eventValue.count) else {
                throw ZaiError.InvalidEventValue
            }
        }
        
        var events: [Event] = []
        
        self.timestamp = timestamp
        var tmpTimestamp = timestamp
        
        for (itemId, eventValue) in zip(itemIds, superEventValues) {
            events.append(Event(userId: userId, itemId: itemId, timestamp: tmpTimestamp, eventType: superEventType, eventValue: String(eventValue.prefix(500))))
            tmpTimestamp += Config.epsilon
        }
        
        if events.count == 0 {
            throw ZaiError.EmptyBatch
        }
        
        if events.count > Config.batchRequestCap {
            throw ZaiError.BatchSizeLimitExceeded
        }
        
        payload = events
    }
    
    public func getPayload() -> [Event] {
        return self.payload
    }
}
