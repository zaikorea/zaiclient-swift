import Foundation

public struct EventLoggerResponse: Decodable {
    public var message: String
    public var failureCount: Int
    public var timestamp: Double
    public var processedEvents: [Event]
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case failureCount = "failure_count"
        case timestamp = "timestamp"
        case processedEvents = "processed_events"
    }
}
