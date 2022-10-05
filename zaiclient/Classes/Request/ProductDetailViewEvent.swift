import Foundation

public class ProductDetailViewEvent: BaseEvent {
    private let defaultEventType: String = "product_detail_view"
    private let defaultEventValue: String = "null"
    
    public required init(userId: String, itemId: String, timestamp: Double = Date().timeIntervalSince1970) throws {
        try super.init(userId: userId, itemIds: [itemId], superEventType: defaultEventType, superEventValues: [defaultEventValue], timestamp: timestamp)
    }
}
