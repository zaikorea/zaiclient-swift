import Foundation

open class BaseEvent {

    public var timestamp: Double
    private var userId: String
    private var itemIds: [String]
    private var superEventType: String
    private var superEventValues: [String]
    
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
        
        if itemIds.count == 0 {
            throw ZaiError.EmptyBatch
        }
        if itemIds.count > Config.batchRequestCap {
            throw ZaiError.BatchSizeLimitExceeded
        }
        
        self.userId = userId
        self.itemIds = itemIds
        self.superEventType = superEventType
        self.superEventValues = superEventValues
        self.timestamp = timestamp
        
    }
    
    public func getPayload(isTest: Bool = false) -> [Event] {
        var events: [Event] = []

        var tmpTimestamp = timestamp
        
        for (itemId, eventValue) in zip(itemIds, superEventValues) {
            let timeToLive: Int? = (isTest) ? 60 * 60 * 24 : nil
            events.append(Event(userId: userId, itemId: itemId, timestamp: tmpTimestamp, eventType: superEventType, eventValue: String(eventValue.prefix(500)), timeToLive: timeToLive))
            tmpTimestamp += Config.epsilon
        }
        
        return events
    }
}
