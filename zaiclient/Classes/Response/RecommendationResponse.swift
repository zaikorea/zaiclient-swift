import Foundation

public struct RecommendationResponse: Decodable {
    public var items: [String]
    public var count: Int
    public var timestamp: Double
}
