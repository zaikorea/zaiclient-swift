import Foundation

public struct RecommendationResponse: Decodable {
    public var items: [String]
    public var count: Int
    public var metadata: String
    public var timestamp: Double

    enum CodingKeys: String, CodingKey {
        case items, count, metadata, timestamp
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([String].self, forKey: .items)
        count = try container.decode(Int.self, forKey: .count)
        metadata = try container.decode(String.self, forKey: .metadata)
        timestamp = try container.decode(Double.self, forKey: .timestamp)
        
        do {
            try JSONSerialization.jsonObject(with: Data(container.decode(String.self, forKey: .metadata).utf8), options: .mutableContainers)
        } catch {
            print("WARNING: Failed to parse the metadata to object, returning an empty object. metadata: \(metadata)")
            metadata = "{}"
        }
    }
}
