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
                    let e = try? ProductDetailViewEvent(userId: generateUUID(), itemId: generateUUID())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? ProductDetailViewEvent(userId: generateUUID(), itemId: generateUUID(), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("updateEventLog") {
                    var flag = false
                    let userId = generateUUID()
                    let event = try? ProductDetailViewEvent(userId: userId, itemId: generateUUID())
                    let newEvent = try? ProductDetailViewEvent(userId: userId, itemId: generateUUID(), timestamp: event!.timestamp)
                    
                    checkSuccessfulEventUpdate(event: event, newEvent: newEvent) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("deleteEventLog") {
                    var flag = false
                    let e = try? ProductDetailViewEvent(userId: generateUUID(), itemId: generateUUID())
                    checkSuccessfulEventDelete(event: e) {
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
                    let e = try? PageViewEvent(userId: generateUUID(), pageType: generateUUID())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? PageViewEvent(userId: generateUUID(), pageType: generateUUID(), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("updateEventLog") {
                    var flag = false
                    let userId = generateUUID()
                    let event = try? PageViewEvent(userId: userId, pageType: generatePageType())
                    let newEvent = try? PageViewEvent(userId: userId, pageType: generatePageType(), timestamp: event!.timestamp)
                    
                    checkSuccessfulEventUpdate(event: event, newEvent: newEvent) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("deleteEventLog") {
                    var flag = false
                    let e = try? PageViewEvent(userId: generateUUID(), pageType: generatePageType())
                    checkSuccessfulEventDelete(event: e) {
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
                    let e = try? LikeEvent(userId: generateUUID(), itemId: generateUUID())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? LikeEvent(userId: generateUUID(), itemId: generateUUID(), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("updateEventLog") {
                    var flag = false
                    let userId = generateUUID()
                    let event = try? LikeEvent(userId: userId, itemId: generateUUID())
                    let newEvent = try? LikeEvent(userId: userId, itemId: generateUUID(), timestamp: event!.timestamp)
                    
                    checkSuccessfulEventUpdate(event: event, newEvent: newEvent) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("deleteEventLog") {
                    var flag = false
                    let e = try? LikeEvent(userId: generateUUID(), itemId: generateUUID())
                    checkSuccessfulEventDelete(event: e) {
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
                    let e = try? CartaddEvent(userId: generateUUID(), itemId: generateUUID())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? CartaddEvent(userId: generateUUID(), itemId: generateUUID(), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("updateEventLog") {
                    var flag = false
                    let userId = generateUUID()
                    let event = try? CartaddEvent(userId: userId, itemId: generateUUID())
                    let newEvent = try? CartaddEvent(userId: userId, itemId: generateUUID(), timestamp: event!.timestamp)
                    
                    checkSuccessfulEventUpdate(event: event, newEvent: newEvent) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("deleteEventLog") {
                    var flag = false
                    let e = try? CartaddEvent(userId: generateUUID(), itemId: generateUUID())
                    checkSuccessfulEventDelete(event: e) {
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
                    let e = try? RateEvent(userId: generateUUID(), itemId: generateUUID(), rating: generateRandomDouble(min: 0, max: 5))
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? RateEvent(userId: generateUUID(), itemId: generateUUID(), rating: generateRandomDouble(min: 0, max: 5), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("updateEventLog") {
                    var flag = false
                    let userId = generateUUID()
                    let event = try? RateEvent(userId: userId, itemId: generateUUID(), rating: generateRandomDouble(min: 0, max: 5))
                    let newEvent = try? RateEvent(userId: userId, itemId: generateUUID(), rating: generateRandomDouble(min: 0, max: 5), timestamp: event!.timestamp)
                    
                    checkSuccessfulEventUpdate(event: event, newEvent: newEvent) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("deleteEventLog") {
                    var flag = false
                    let e = try? RateEvent(userId: generateUUID(), itemId: generateUUID(), rating: generateRandomDouble(min: 0, max: 5))
                    checkSuccessfulEventDelete(event: e) {
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
                    let e = try? SearchEvent(userId: generateUUID(), searchQuery: generateQuery())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? SearchEvent(userId: generateUUID(), searchQuery: generateQuery(), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("updateEventLog") {
                    var flag = false
                    let userId = generateUUID()
                    let event = try? SearchEvent(userId: userId, searchQuery: generateQuery())
                    let newEvent = try? SearchEvent(userId: userId, searchQuery: generateQuery(), timestamp: event!.timestamp)
                    
                    checkSuccessfulEventUpdate(event: event, newEvent: newEvent) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("deleteEventLog") {
                    var flag = false
                    let e = try? SearchEvent(userId: generateUUID(), searchQuery: generateQuery())
                    checkSuccessfulEventDelete(event: e) {
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
                    let e = try? PurchaseEvent(userId: generateUUID(), itemId: generateUUID(), price: generateRandomInt(min: 0, max: 500000))
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? PurchaseEvent(userId: generateUUID(), itemId: generateUUID(), price: generateRandomInt(min: 0, max: 500000), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addBatchEventLog") {
                    var flag = false
                    let e = try? PurchaseEvent(userId: generateUUID(), itemIds: Array(repeating: generateUUID(), count: 10), prices: Array(repeating: generateRandomInt(min: 0, max: 500000), count: 10))
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addBatchEventLog with manual timestamp") {
                    var flag = false
                    let e = try? PurchaseEvent(userId: generateUUID(), itemIds: Array(repeating: generateUUID(), count: 10), prices: Array(repeating: generateRandomInt(min: 0, max: 500000), count: 10), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("updateEventLog") {
                    var flag = false
                    let userId = generateUUID()
                    let event = try? PurchaseEvent(userId: userId, itemId: generateUUID(), price: generateRandomInt(min: 0, max: 500000))
                    let newEvent = try? PurchaseEvent(userId: userId, itemId: generateUUID(), price: generateRandomInt(min: 0, max: 500000), timestamp: event!.timestamp)
                    
                    checkSuccessfulEventUpdate(event: event, newEvent: newEvent) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("deleteEventLog") {
                    var flag = false
                    let e = try? PurchaseEvent(userId: generateUUID(), itemId: generateUUID(), price: generateRandomInt(min: 0, max: 5000000))
                    checkSuccessfulEventDelete(event: e) {
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
                    let e = try? CustomEvent(userId: generateUUID(), itemId: generateUUID(), eventType: "customEvent", eventValue: generateQuery())
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addEventLog with manual timestamp") {
                    var flag = false
                    let e = try? CustomEvent(userId: generateUUID(), itemId: generateUUID(), eventType: "customEvent", eventValue: generateQuery(), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addBatchEventLog") {
                    var flag = false
                    let e = try? CustomEvent(userId: generateUUID(), itemIds: Array(repeating: generateUUID(), count: 10), eventType: "customEvent", eventValues: Array(repeating: generateQuery(), count: 10))
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("addBatchEventLog with manual timestamp") {
                    var flag = false
                    let e = try? CustomEvent(userId: generateUUID(), itemIds: Array(repeating: generateUUID(), count: 10), eventType: "customEvent", eventValues: Array(repeating: generateQuery(), count: 10), timestamp: Date().timeIntervalSince1970)
                    checkSuccessfulEventAdd(event: e) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("updateEventLog") {
                    var flag = false
                    let userId = generateUUID()
                    let event = try? CustomEvent(userId: userId, itemId: generateUUID(), eventType: "customEvent", eventValue: generateUUID())
                    let newEvent = try? CustomEvent(userId: userId, itemId: generateUUID(), eventType: "customEvent", eventValue: generateUUID(), timestamp: event!.timestamp)
                    
                    checkSuccessfulEventUpdate(event: event, newEvent: newEvent) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("deleteEventLog") {
                    var flag = false
                    let e = try? CustomEvent(userId: generateUUID(), itemId: generateUUID(), eventType: "customEvent", eventValue: generateUUID())

                    checkSuccessfulEventDelete(event: e) {
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
