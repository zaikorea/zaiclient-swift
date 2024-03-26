import Foundation

public class AddPageViewEvent: EventRequest {
    private let defaultEventType: String = "page_view"
    private let defaultItemId: String = "null"

    public required init(
        userId: String,
        pageType: String,
        timestamp: Double = Date().timeIntervalSince1970,
        from: String = "",
        containsZaiRec: Bool = false,
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
            eventValues: [pageType],
            from: [from],
            isZaiRec: [containsZaiRec],
            url: url,
            ref: ref,
            recommendationId: recommendationId,
            eventProperties: eventProperties,
            userProperties: userProperties
        )
    }
}
