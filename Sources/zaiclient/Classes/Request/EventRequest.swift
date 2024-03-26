import Foundation

open class EventRequest: Request {

    private var userId: String
    private var itemIds: [String]
    private var timestamp: Double
    private var eventType: String
    private var eventValues: [String]
    private var from: [String]
    private var isZaiRec: [Bool]
    private var url: String
    private var ref: String
    private var recommendationId: String
    private var eventProperties: [String: String]
    private var userProperties: [String: String]
    
    init(
        userId: String,
        itemIds: [String],
        timestamp: Double,
        eventType: String,
        eventValues: [String],
        from: [String],
        isZaiRec: [Bool],
        url: String,
        ref: String,
        recommendationId: String,
        eventProperties: [String: String],
        userProperties: [String: String]
    ) throws {
        // Input validation
        guard (1...500).contains(userId.count) else {
            throw ZaiError.InvalidUserId
        }
        for itemId in itemIds {
            guard (1...500).contains(itemId.count) else {
                throw ZaiError.InvalidItemId
            }
        }
        guard (1...500).contains(eventType.count) else {
            throw ZaiError.InvalidEventType
        }
        for eventValue in eventValues {
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
        self.timestamp = timestamp
        self.eventType = eventType
        self.eventValues = eventValues
        self.from = from
        self.isZaiRec = isZaiRec
        self.url = url
        self.ref = ref
        self.recommendationId = recommendationId
        self.eventProperties = eventProperties
        self.userProperties = userProperties
        
        super.init(method: .post, baseUrl: Config.collectorApiEndPoint)
    }
    
    override func getPath(clientId: String) -> String {
        return Config.eventsApiPath
    }
    
    override public func getPayload(isTest: Bool = false) -> [Event] {
        var events: [Event] = []

        var tmpTimestamp = self.timestamp
        
        for idx in 0..<self.itemIds.count{
            let timeToLive: Int? = (isTest) ? 60 * 60 * 24 : nil
            let _from: String? = (self.from[idx].count == 0) ? nil : String(self.from[idx].prefix(500))
            
            events.append(
                Event(
                    userId: self.userId,
                    itemId: self.itemIds[idx],
                    timestamp: tmpTimestamp,
                    eventType: self.eventType,
                    eventValue: String(self.eventValues[idx].prefix(500)),
                    timeToLive: timeToLive,
                    isZaiRec: self.isZaiRec[idx],
                    from: _from,
                    url: self.url.count == 0 ? nil : self.url,
                    ref: self.ref.count == 0 ? nil : self.ref,
                    recommendationId: self.recommendationId.count == 0 ? nil : self.recommendationId,
                    eventProperties: self.eventProperties.count == 0 ? nil : self.eventProperties,
                    userProperties: self.userProperties.count == 0 ? nil : self.userProperties
                )
            )
            tmpTimestamp += Config.epsilon
        }
        
        return events
    }
}
