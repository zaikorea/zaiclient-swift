import Foundation

public class AddSearchEvent: EventRequest {
    private let defaultItemId: String = "null"
    private let defaultEventType: String = "search"

    public required init(
        userId: String,
        searchQuery: String,
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
            itemIds: [defaultItemId],
            timestamp: timestamp,
            eventType: defaultEventType,
            eventValues: [searchQuery],
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
