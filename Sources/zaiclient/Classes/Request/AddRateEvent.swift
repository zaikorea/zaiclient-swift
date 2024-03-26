import Foundation


public class AddRateEvent: EventRequest {
    private let defaultEventType: String = "rate"

    public required init(
        userId: String,
        itemId: String,
        rating: Double,
        timestamp: Double = Date().timeIntervalSince1970,
        from: String = "",
        isZaiRec: Bool = false,
        url: String = "",
        ref: String = "",
        recommendationId: String = "",
        eventProperties: [String: String] = [:],
        userProperties: [String: String] = [:]
    ) throws {
        try super.init(
            userId: userId,
            itemIds: [itemId],
            timestamp: timestamp,
            eventType: defaultEventType,
            eventValues: [String(rating)],
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
