import Foundation

open class BaseEvent {

    public var timestamp: Double
    private var payload: [Event]
    
    init(userId: String, itemIds: [String], superEventType: String, superEventValues: [String], timestamp: Double) throws {
        // Input validation
        if !(1...100).contains(userId.count) {
            throw ZaiError.InvalidUserId
        }
        for itemId in itemIds {
            if !(1...100).contains(itemId.count) {
                throw ZaiError.InvalidItemId
            }
        }
        if !(0...100).contains(superEventType.count) {
            throw ZaiError.InvalidEventType
        }
        for eventValue in superEventValues {
            if !(0...100).contains(eventValue.count) {
                throw ZaiError.InvalidEventValue
            }
        }
        
        var events: [Event] = []
        
        self.timestamp = timestamp
        var tmpTimestamp = timestamp
        
        for (itemId, eventValue) in zip(itemIds, superEventValues) {
            events.append(Event(userId: userId, itemId: itemId, timestamp: tmpTimestamp, eventType: superEventType, eventValue: eventValue))
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
