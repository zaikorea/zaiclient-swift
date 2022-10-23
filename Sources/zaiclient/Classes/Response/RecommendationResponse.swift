import Foundation

public struct RecommendationResponse: Decodable {
    public var items: [String]
    public var count: Int
    public var metadata: String
    public var timestamp: Double

    enum CodingKeys: String, CodingKey {
        case items, count, metadata, timestamp
    }
}
