import Foundation

public class AddCartaddEvent: EventRequest {
    private let defaultEventType: String = "cartadd"
    private let defaultEventValue: String = "null"

    public required init(
        userId: String,
        itemId: String,
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
            eventValues: [defaultEventValue],
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
