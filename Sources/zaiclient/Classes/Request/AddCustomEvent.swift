import Foundation

public class AddCustomEvent: EventRequest {
    
    public required override init(
        userId: String,
        itemIds: [String],
        timestamp: Double = Date().timeIntervalSince1970,
        eventType: String,
        eventValues: [String],
        from: [String]? = nil,
        isZaiRec: [Bool]? = nil,
        url: String = "",
        ref: String = "",
        recommendationId: String = "",
        eventProperties: [String: String] = [:],
        userProperties: [String: String] = [:]
    ) throws {
        if itemIds.count != eventValues.count {
            throw ZaiError.InputLengthNotEqual
        }
        
        let _from: [String] = from ?? [String](repeating: "", count: itemIds.count)
        let _isZaiRec: [Bool] = isZaiRec ?? [Bool](repeating: false, count: itemIds.count)

        try super.init(
            userId: userId,
            itemIds: itemIds,
            timestamp: timestamp,
            eventType: eventType,
            eventValues: eventValues,
            from: _from,
            isZaiRec: _isZaiRec,
            url: url,
            ref: ref,
            recommendationId: recommendationId,
            eventProperties: eventProperties,
            userProperties: userProperties
        )
    }
    
    public convenience init(
        userId: String,
        itemId: String,
        timestamp: Double = Date().timeIntervalSince1970,
        eventType: String,
        eventValue: String,
        from: String = "",
        isZaiRec: Bool = false,
        url: String = "",
        ref: String = "",
        recommendationId: String = "",
        eventProperties: [String: String] = [:],
        userProperties: [String: String] = [:]
    ) throws {
        try self.init(
            userId: userId,
            itemIds: [itemId],
            timestamp: timestamp,
            eventType: eventType,
            eventValues: [eventValue],
            from: [from],
            isZaiRec: [isZaiRec],
            url: url,
            ref: ref,
            recommendationId: recommendationId,
            eventProperties: eventProperties,
            userProperties: userProperties
        )
    }
    
}
