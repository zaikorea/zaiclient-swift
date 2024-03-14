import Foundation

open class EventRequest: Request {

    public var timestamp: Double
    private var userId: String
    private var itemIds: [String]
    private var superEventType: String
    private var superEventValues: [String]
    private var superFroms: [String]
    private var superIsZaiRecs: [Bool]
    
    init(userId: String, itemIds: [String], superEventType: String, superEventValues: [String], timestamp: Double, superFroms: [String], superIsZaiRecs: [Bool]) throws {
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
        self.superFroms = superFroms
        self.superIsZaiRecs = superIsZaiRecs
        
        super.init(method: .post, baseUrl: Config.collectorApiEndPoint)
    }
    
    override func getPath(clientId: String) -> String {
        return Config.eventsApiPath
    }
    
    override public func getPayload(isTest: Bool = false) -> [Event] {
        var events: [Event] = []

        var tmpTimestamp = timestamp
        
        for idx in 0..<itemIds.count{
            let timeToLive: Int? = (isTest) ? 60 * 60 * 24 : nil
            let _from: String? = (superFroms[idx].count == 0) ? nil : String(superFroms[idx].prefix(500))
            
            events.append(Event(userId: userId, itemId: itemIds[idx], timestamp: tmpTimestamp, eventType: superEventType, eventValue: String(superEventValues[idx].prefix(500)), timeToLive: timeToLive, from: _from, isZaiRec: superIsZaiRecs[idx]))
            tmpTimestamp += Config.epsilon
        }
        
        return events
    }
    
}
