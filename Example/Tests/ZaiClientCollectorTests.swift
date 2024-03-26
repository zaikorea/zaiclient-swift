//  Copyright © 2022 CocoaPods. All rights reserved.

import Quick
import Nimble
import zaiclient

class ZaiClientCollectorSpec: QuickSpec {
    override func spec() {
        describe("ZaiClient.ProductDetailViewEvent successful user scenario") {
            context("these will pass") {
                it("addEventLog") {
                    var flag = false
                    let e = try? AddProductDetailViewEvent(userId: generateUUID(), itemId: generateUUID())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? AddProductDetailViewEvent(userId: generateUUID(), itemId: generateUUID(), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with isTest true") {
                    var flag = false
                    let e = try? AddProductDetailViewEvent(userId: generateUUID(), itemId: generateUUID())
                    checkSuccessfulEventAdd(event: e, isTest: true) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with isZaiRec true") {
                    var flag = false
                    let e = try? AddProductDetailViewEvent(userId: generateUUID(), itemId: generateUUID(), isZaiRec: true)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with from field") {
                    var flag = false
                    let e = try? AddProductDetailViewEvent(userId: generateUUID(), itemId: generateUUID(), from: generatePageType())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with isZaiRec true and from field") {
                    var flag = false
                    let e = try? AddProductDetailViewEvent(userId: generateUUID(), itemId: generateUUID(), from: generatePageType(), isZaiRec: true)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with userProperties and eventProperties") {
                    var flag = false
                    let e = try? AddProductDetailViewEvent(userId: generateUUID(), itemId: generateUUID(), from: generatePageType(), isZaiRec: true, eventProperties: ["key" : "value"], userProperties: ["key2" : "value2"])
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
            }
        }
        
        describe("ZaiClient.PageViewEvent successful user scenario") {
            context("these will pass") {
                it("addEventLog") {
                    var flag = false
                    let e = try? AddPageViewEvent(userId: generateUUID(), pageType: generateUUID())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? AddPageViewEvent(userId: generateUUID(), pageType: generateUUID(), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with isTest true") {
                    var flag = false
                    let e = try? AddPageViewEvent(userId: generateUUID(), pageType: generateUUID())
                    checkSuccessfulEventAdd(event: e, isTest: true) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with containsZaiRec true") {
                    var flag = false
                    let e = try? AddPageViewEvent(userId: generateUUID(), pageType: generateUUID(), containsZaiRec: true)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
            }
        }
        
        describe("ZaiClient.LikeEvent successful user scenario") {
            context("these will pass") {
                it("addEventLog") {
                    var flag = false
                    let e = try? AddLikeEvent(userId: generateUUID(), itemId: generateUUID())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? AddLikeEvent(userId: generateUUID(), itemId: generateUUID(), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with isTest true") {
                    var flag = false
                    let e = try? AddLikeEvent(userId: generateUUID(), itemId: generateUUID())
                    checkSuccessfulEventAdd(event: e, isTest: true) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with isZaiRec true") {
                    var flag = false
                    let e = try? AddLikeEvent(userId: generateUUID(), itemId: generateUUID(), isZaiRec: true)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with from field") {
                    var flag = false
                    let e = try? AddLikeEvent(userId: generateUUID(), itemId: generateUUID(), from: generatePageType())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with isZaiRec true and from field") {
                    var flag = false
                    let e = try? AddLikeEvent(userId: generateUUID(), itemId: generateUUID(), from: generatePageType(), isZaiRec: true)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
            }
        }
        
        describe("ZaiClient.CartaddEvent successful user scenario") {
            context("these will pass") {
                it("addEventLog") {
                    var flag = false
                    let e = try? AddCartaddEvent(userId: generateUUID(), itemId: generateUUID())
                    
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? AddCartaddEvent(userId: generateUUID(), itemId: generateUUID(), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with isTest true") {
                    var flag = false
                    let e = try? AddCartaddEvent(userId: generateUUID(), itemId: generateUUID())
                    checkSuccessfulEventAdd(event: e, isTest: true) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with isZaiRec true") {
                    var flag = false
                    let e = try? AddCartaddEvent(userId: generateUUID(), itemId: generateUUID(), isZaiRec: true)
                    
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with from field") {
                    var flag = false
                    let e = try? AddCartaddEvent(userId: generateUUID(), itemId: generateUUID(), from: generatePageType())
                    
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with isZaiRec true and from field") {
                    var flag = false
                    let e = try? AddCartaddEvent(userId: generateUUID(), itemId: generateUUID(), from: generatePageType(), isZaiRec: true)
                    
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
            }
        }
        
        describe("ZaiClient.RateEvent successful user scenario") {
            context("these will pass") {
                it("addEventLog") {
                    var flag = false
                    let e = try? AddRateEvent(userId: generateUUID(), itemId: generateUUID(), rating: generateRandomDouble(min: 0, max: 5))
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? AddRateEvent(userId: generateUUID(), itemId: generateUUID(), rating: generateRandomDouble(min: 0, max: 5), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with isTest true") {
                    var flag = false
                    let e = try? AddRateEvent(userId: generateUUID(), itemId: generateUUID(), rating: generateRandomDouble(min: 0, max: 5))
                    checkSuccessfulEventAdd(event: e, isTest: true) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with isZaiRec true") {
                    var flag = false
                    let e = try? AddRateEvent(userId: generateUUID(), itemId: generateUUID(), rating: generateRandomDouble(min: 0, max: 5), isZaiRec: true)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
            }
        }
        
        describe("ZaiClient.SearchEvent successful user scenario") {
            context("these will pass") {
                it("addEventLog") {
                    var flag = false
                    let e = try? AddSearchEvent(userId: generateUUID(), searchQuery: generateQuery())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? AddSearchEvent(userId: generateUUID(), searchQuery: generateQuery(), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with isTest true") {
                    var flag = false
                    let e = try? AddSearchEvent(userId: generateUUID(), searchQuery: generateQuery())
                    checkSuccessfulEventAdd(event: e, isTest: true) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with isZaiRec true") {
                    var flag = false
                    let e = try? AddSearchEvent(userId: generateUUID(), searchQuery: generateQuery(), isZaiRec: true)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
            }
        }
        
        describe("ZaiClient.PurchaseEvent successful user scenario") {
            context("these will pass") {
                it("addEventLog") {
                    var flag = false
                    let e = try? AddPurchaseEvent(userId: generateUUID(), itemId: generateUUID(), price: generateRandomInt(min: 0, max: 500000))
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? AddPurchaseEvent(userId: generateUUID(), itemId: generateUUID(), price: generateRandomInt(min: 0, max: 500000), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with isTest true") {
                    var flag = false
                    let e = try? AddPurchaseEvent(userId: generateUUID(), itemId: generateUUID(), price: generateRandomInt(min: 0, max: 500000))
                    checkSuccessfulEventAdd(event: e, isTest: true) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with isZaiRec true") {
                    var flag = false
                    let e = try? AddPurchaseEvent(userId: generateUUID(), itemId: generateUUID(), price: generateRandomInt(min: 0, max: 500000), isZaiRec: true)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                
                it("addBatchEventLog") {
                    var flag = false
                    let e = try? AddPurchaseEvent(userId: generateUUID(), itemIds: Array(repeating: generateUUID(), count: 10), prices: Array(repeating: generateRandomInt(min: 0, max: 500000), count: 10))
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addBatchEventLog with manual timestamp") {
                    var flag = false
                    let e = try? AddPurchaseEvent(userId: generateUUID(), itemIds: Array(repeating: generateUUID(), count: 10), prices: Array(repeating: generateRandomInt(min: 0, max: 500000), count: 10), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addBatchEventLog with isTest true") {
                    var flag = false
                    let e = try? AddPurchaseEvent(userId: generateUUID(), itemIds: Array(repeating: generateUUID(), count: 10), prices: Array(repeating: generateRandomInt(min: 0, max: 500000), count: 10))
                    checkSuccessfulEventAdd(event: e, isTest: true) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addBatchEventLog with isZaiRec true") {
                    var flag = false
                    let e = try? AddPurchaseEvent(userId: generateUUID(), itemIds: Array(repeating: generateUUID(), count: 10), prices: Array(repeating: generateRandomInt(min: 0, max: 500000), count: 10), isZaiRec: Array(repeating: true, count: 10))
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
            }
        }
        
        describe("ZaiClient.CustomEvent successful user scenario") {
            context("these will pass") {
                it("addEventLog") {
                    var flag = false
                    let e = try? AddCustomEvent(userId: generateUUID(), itemId: generateUUID(), eventType: "customEvent", eventValue: generateQuery())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? AddCustomEvent(userId: generateUUID(), itemId: generateUUID(), timestamp: Date().timeIntervalSince1970, eventType: "customEvent", eventValue: generateQuery())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with isTest true") {
                    var flag = false
                    let e = try? AddCustomEvent(userId: generateUUID(), itemId: generateUUID(), eventType: "customEvent", eventValue: generateQuery())
                    checkSuccessfulEventAdd(event: e, isTest: true) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with isZaiRec true") {
                    var flag = false
                    let e = try? AddCustomEvent(userId: generateUUID(), itemId: generateUUID(), eventType: "customEvent", eventValue: generateQuery(), isZaiRec: true)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with from field") {
                    var flag = false
                    let e = try? AddCustomEvent(userId: generateUUID(), itemId: generateUUID(), eventType: "customEvent", eventValue: generateQuery(), from: generatePageType())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addEventLog with isZaiRec true and from field") {
                    var flag = false
                    let e = try? AddCustomEvent(userId: generateUUID(), itemId: generateUUID(), eventType: "customEvent", eventValue: generateQuery(), from: generatePageType(), isZaiRec: true)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addBatchEventLog") {
                    var flag = false
                    let e = try? AddCustomEvent(userId: generateUUID(), itemIds: Array(repeating: generateUUID(), count: 10), eventType: "customEvent", eventValues: Array(repeating: generateQuery(), count: 10))
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addBatchEventLog with manual timestamp") {
                    var flag = false
                    let e = try? AddCustomEvent(userId: generateUUID(), itemIds: Array(repeating: generateUUID(), count: 10), eventType: "customEvent", eventValues: Array(repeating: generateQuery(), count: 10))
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addBatchEventLog with isTest true") {
                    var flag = false
                    let e = try? AddCustomEvent(userId: generateUUID(), itemIds: Array(repeating: generateUUID(), count: 10), eventType: "customEvent", eventValues: Array(repeating: generateQuery(), count: 10))
                    checkSuccessfulEventAdd(event: e, isTest: true) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addBatchEventLog with isZaiRec true") {
                    var flag = false
                    let e = try? AddCustomEvent(userId: generateUUID(), itemIds: Array(repeating: generateUUID(), count: 10), eventType: "customEvent", eventValues: Array(repeating: generateQuery(), count: 10), isZaiRec: Array(repeating: true, count: 10))
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addBatchEventLog with from field") {
                    var flag = false
                    let e = try? AddCustomEvent(userId: generateUUID(), itemIds: Array(repeating: generateUUID(), count: 10), eventType: "customEvent", eventValues: Array(repeating: generateQuery(), count: 10), from: Array(repeating: generatePageType(), count: 10))
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                it("addBatchEventLog with isZaiRec true and from field") {
                    var flag = false
                    let e = try? AddCustomEvent(userId: generateUUID(), itemIds: Array(repeating: generateUUID(), count: 10), eventType: "customEvent", eventValues: Array(repeating: generateQuery(), count: 10), from: Array(repeating: generatePageType(), count: 10), isZaiRec: Array(repeating: true, count: 10))
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
            }
        }
    }
}
