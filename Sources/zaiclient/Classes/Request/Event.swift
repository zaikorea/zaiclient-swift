import Foundation

//struct AnyEncodable: Encodable {
//    let value: Any
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//
//        switch value {
//        case let stringValue as String:
//            try container.encode(stringValue)
//        case let intValue as Int:
//            try container.encode(intValue)
//        // 다른 타입에 대한 케이스도 추가...
//        default:
//            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: container.codingPath, debugDescription: "타입을 인코딩할 수 없음"))
//        }
//    }
//}


public class Event: Encodable {
    public var userId: String
    public var itemId: String
    public var timestamp: Double
    public var eventType: String
    public var eventValue: String
    public var timeToLive: Int? = nil
    public var isZaiRec: Bool = false
    public var from: String? = nil
    public var url: String? = nil
    public var ref: String? = nil
    public var recommendationId: String? = nil
//    public var eventProperties: [String: Any]? = nil
//    public var userProperties: [String: Any]? = nil
    
    enum CodingKeys: String,
        CodingKey {
            case userId = "user_id"
            case itemId = "item_id"
            case timestamp = "timestamp"
            case eventType = "event_type"
            case eventValue = "event_value"
            case timeToLive = "time_to_live"
            case isZaiRec = "is_zai_recommendation"
            case from = "from"
            case url = "url"
            case ref = "ref"
            case recommendationId = "recommendation_id"
//            case eventProperties = "event_properties"
//            case userProperties = "user_properties"
    }
    
    init(
        userId: String,
        itemId: String,
        timestamp: Double,
        eventType: String,
        eventValue: String,
        timeToLive: Int?,
        isZaiRec: Bool,
        from: String?,
        url: String?,
        ref: String?,
        recommendationId: String?,
        eventProperties: [String: Any]?,
        userProperties: [String: Any]?
    ) {
        // [String: Any] is not "encodable"
//        let _eventProperties = try? JSONEncoder().encode(eventProperties?.mapValues { AnyEncodable(value: $0) })
//        let _userProperties = try? JSONEncoder().encode(userProperties?.mapValues { AnyEncodable(value: $0) })
        
        self.userId = userId
        self.itemId = itemId
        self.timestamp = timestamp
        self.eventType = eventType
        self.eventValue = eventValue
        self.timeToLive = timeToLive
        self.isZaiRec = isZaiRec
        self.from = from
        self.url = url
        self.ref = ref
        self.recommendationId = recommendationId
//        self.eventProperties = eventProperties
//        self.userProperties = userProperties
    }
}

