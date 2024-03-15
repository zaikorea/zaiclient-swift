import Foundation

public class AddPurchaseEvent: EventRequest {
    private let defaultEventType: String = "purchase"

    public required init(
        userId: String,
        itemIds: [String],
        prices: [Int],
        timestamp: Double = Date().timeIntervalSince1970,
        isZaiRec: [Bool]? = nil,
        url: String = "",
        ref: String = "",
        recommendationId: String = "",
        eventProperties: [String: Any] = [:],
        userProperties: [String: Any] = [:]
    ) throws {
        if itemIds.count != prices.count {
            throw ZaiError.InputLengthNotEqual
        }

        let _isZaiRec: [Bool] = isZaiRec ?? [Bool](repeating: false, count: itemIds.count)

        try super.init(
            userId: userId,
            itemIds: itemIds,
            timestamp: timestamp,
            eventType: defaultEventType,
            eventValues: prices.map {String($0)},
            from: [String](repeating: "", count: itemIds.count),
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
        price: Int,
        timestamp: Double = Date().timeIntervalSince1970,
        isZaiRec: Bool = false,
        url: String = "",
        ref: String = "",
        recommendationId: String = "",
        eventProperties: [String: Any] = [:],
        userProperties: [String: Any] = [:]
    ) throws {
        try self.init(
            userId: userId,
            itemIds: [itemId],
            prices: [price],
            timestamp: timestamp,
            isZaiRec: [isZaiRec],
            url: url,
            ref: ref,
            recommendationId: recommendationId,
            eventProperties: eventProperties,
            userProperties: userProperties
        )
    }
}
