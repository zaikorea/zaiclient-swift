//  Copyright © 2022 CocoaPods. All rights reserved.

import Quick
import Nimble
import zaiclient

class ZaiClientRecommendationSpec: QuickSpec {
    override func spec() {
        describe("UserRecommendationRequest") {
            context("these will pass without options") {
                it("userId, limit") {
                    var flag = false
                    let recommendation = try? GetUserRecommendation(userId: generateUUID(), limit: generateRandomInt(min: 1, max: 50))
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, offset") {
                    var flag = false
                    let recommendation = try? GetUserRecommendation(userId: generateUUID(), limit: generateRandomInt(min: 10, max: 50), offset: generateRandomInt(min: 0, max: 9))
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, offset, recommendationType") {
                    var flag = false
                    let recommendation = try? GetUserRecommendation(userId: generateUUID(), limit: generateRandomInt(min: 10, max: 50), offset: generateRandomInt(min: 0, max: 9), recommendationType: generatePageType())
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, recommendationType") {
                    var flag = false
                    let recommendation = try? GetUserRecommendation(userId: generateUUID(), limit: generateRandomInt(min: 10, max: 50), recommendationType: generatePageType())
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit when userId is nil") {
                    var flag = false
                    let recommendation = try? GetUserRecommendation(userId: nil, limit: generateRandomInt(min: 1, max: 50))
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, offset when userId is nil") {
                    var flag = false
                    let recommendation = try? GetUserRecommendation(userId: nil, limit: generateRandomInt(min: 10, max: 50), offset: generateRandomInt(min: 0, max: 9))
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, offset, recommendationType when userId is nil") {
                    var flag = false
                    let recommendation = try? GetUserRecommendation(userId: nil, limit: generateRandomInt(min: 10, max: 50), offset: generateRandomInt(min: 0, max: 9), recommendationType: generatePageType())
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, recommendationType when userId is nil") {
                    var flag = false
                    let recommendation = try? GetUserRecommendation(userId: nil, limit: generateRandomInt(min: 10, max: 50), recommendationType: generatePageType())
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
            }
            context("these will pass with options") {
                it("userId, limit, options") {
                    var flag = false
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetUserRecommendation(userId: generateUUID(), limit: generateRandomInt(min: 1, max: 50), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, offset, options") {
                    var flag = false
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetUserRecommendation(userId: generateUUID(), limit: generateRandomInt(min: 10, max: 50), offset: generateRandomInt(min: 0, max: 9), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, offset, recommendationType, options") {
                    var flag = false
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetUserRecommendation(userId: generateUUID(), limit: generateRandomInt(min: 10, max: 50), offset: generateRandomInt(min: 0, max: 9), recommendationType: generatePageType(), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, recommendationType, options") {
                    var flag = false
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetUserRecommendation(userId: generateUUID(), limit: generateRandomInt(min: 10, max: 50), recommendationType: generatePageType(), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, options when userId is nil") {
                    var flag = false
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetUserRecommendation(userId: nil, limit: generateRandomInt(min: 1, max: 50), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, offset, options when userId is nil") {
                    var flag = false
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetUserRecommendation(userId: nil, limit: generateRandomInt(min: 10, max: 50), offset: generateRandomInt(min: 0, max: 9), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, offset, recommendationType, options when userId is nil") {
                    var flag = false
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetUserRecommendation(userId: nil, limit: generateRandomInt(min: 10, max: 50), offset: generateRandomInt(min: 0, max: 9), recommendationType: generatePageType(), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, recommendationType, options when userId is nil") {
                    var flag = false
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetUserRecommendation(userId: nil, limit: generateRandomInt(min: 10, max: 50), recommendationType: generatePageType(), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
            }
        }
        
        describe("RelatedItemsRecommendationRequest") {
            context("these will pass without options") {
                it("userId, limit") {
                    var flag = false
                    let recommendation = try? GetRelatedItemsRecommendation(itemId: generateUUID(), limit: generateRandomInt(min: 1, max: 50))
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, offset") {
                    var flag = false
                    let recommendation = try? GetRelatedItemsRecommendation(itemId: generateUUID(), limit: generateRandomInt(min: 10, max: 50), offset: generateRandomInt(min: 0, max: 9))
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, offset, recommendationType") {
                    var flag = false
                    let recommendation = try? GetRelatedItemsRecommendation(itemId: generateUUID(), limit: generateRandomInt(min: 10, max: 50), offset: generateRandomInt(min: 0, max: 9), recommendationType: generatePageType())
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, recommendationType") {
                    var flag = false
                    let recommendation = try? GetRelatedItemsRecommendation(itemId: generateUUID(), limit: generateRandomInt(min: 10, max: 50), recommendationType: generatePageType())
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
            }
            
            context("these will pass with options") {
                it("userId, limit") {
                    var flag = false
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRelatedItemsRecommendation(itemId: generateUUID(), limit: generateRandomInt(min: 1, max: 50), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, offset") {
                    var flag = false
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRelatedItemsRecommendation(itemId: generateUUID(), limit: generateRandomInt(min: 10, max: 50), offset: generateRandomInt(min: 0, max: 9), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, offset, recommendationType") {
                    var flag = false
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRelatedItemsRecommendation(itemId: generateUUID(), limit: generateRandomInt(min: 10, max: 50), offset: generateRandomInt(min: 0, max: 9), recommendationType: generatePageType(), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, limit, recommendationType") {
                    var flag = false
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRelatedItemsRecommendation(itemId: generateUUID(), limit: generateRandomInt(min: 10, max: 50), recommendationType: generatePageType(), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
            }
        }
        
        describe("RerankingRecommendationRequest") {
            context("these will pass without options") {
                it("userId, itemIds") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let recommendation = try? GetRerankingRecommendation(userId: generateUUID(), itemIds: itemIds)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, limit") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let recommendation = try? GetRerankingRecommendation(userId: generateUUID(), itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40))
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, recommendationType") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let recommendation = try? GetRerankingRecommendation(userId: generateUUID(), itemIds: itemIds, recommendationType: generatePageType())
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                
                it("userId, itemIds, limit, offset") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 100)
                    let recommendation = try? GetRerankingRecommendation(userId: generateUUID(), itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40), offset: generateRandomInt(min: 0, max: 9))
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, limit, recommendationType") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let recommendation = try? GetRerankingRecommendation(userId: generateUUID(), itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40), recommendationType: generatePageType())
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, limit, offset, recommendationType") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let recommendation = try? GetRerankingRecommendation(userId: generateUUID(), itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40), offset: generateRandomInt(min: 0, max: 10), recommendationType: generatePageType())
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds when userId is nil") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let recommendation = try? GetRerankingRecommendation(userId: nil, itemIds: itemIds)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, limit when userId is nil") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let recommendation = try? GetRerankingRecommendation(userId: nil, itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40))
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, recommendationType when userId is nil") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let recommendation = try? GetRerankingRecommendation(userId: nil, itemIds: itemIds, recommendationType: generatePageType())
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                
                it("userId, itemIds, limit, offset when userId is nil") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 100)
                    let recommendation = try? GetRerankingRecommendation(userId: nil, itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40), offset: generateRandomInt(min: 0, max: 9))
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, limit, recommendationType when userId is nil") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let recommendation = try? GetRerankingRecommendation(userId: nil, itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40), recommendationType: generatePageType())
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, limit, offset, recommendationType when userId is nil") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let recommendation = try? GetRerankingRecommendation(userId: nil, itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40), offset: generateRandomInt(min: 0, max: 10), recommendationType: generatePageType())
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
            }
            context("these will pass with options") {
                it("userId, itemIds") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRerankingRecommendation(userId: generateUUID(), itemIds: itemIds, options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, limit") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRerankingRecommendation(userId: generateUUID(), itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, recommendationType") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRerankingRecommendation(userId: generateUUID(), itemIds: itemIds, recommendationType: generatePageType(), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                
                it("userId, itemIds, limit, offset") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 100)
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRerankingRecommendation(userId: generateUUID(), itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40), offset: generateRandomInt(min: 0, max: 9), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, limit, recommendationType") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRerankingRecommendation(userId: generateUUID(), itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40), recommendationType: generatePageType(), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, limit, offset, recommendationType") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRerankingRecommendation(userId: generateUUID(), itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40), offset: generateRandomInt(min: 0, max: 10), recommendationType: generatePageType(), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds when userId is nil") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRerankingRecommendation(userId: nil, itemIds: itemIds, options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, limit when userId is nil") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRerankingRecommendation(userId: nil, itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, recommendationType when userId is nil") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRerankingRecommendation(userId: nil, itemIds: itemIds, recommendationType: generatePageType(), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                
                it("userId, itemIds, limit, offset when userId is nil") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRerankingRecommendation(userId: nil, itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40), offset: generateRandomInt(min: 0, max: 9), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, limit, recommendationType when userId is nil") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRerankingRecommendation(userId: nil, itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40), recommendationType: generatePageType(), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
                        (success, error) in if let _ = success {
                            flag = true
                        }
                    }
                    expect(flag).toEventually(equal(true), timeout: .seconds(10))
                }
                
                it("userId, itemIds, limit, offset, recommendationType when userId is nil") {
                    var flag = false
                    let itemIds = Array.init(repeating: generateUUID(), count: 50)
                    let options = generateOptions(n: 10)
                    let recommendation = try? GetRerankingRecommendation(userId: nil, itemIds: itemIds, limit: generateRandomInt(min: 10, max: 40), offset: generateRandomInt(min: 0, max: 10), recommendationType: generatePageType(), options: options)
                    checkSuccessfulRecommendation(recommendation: recommendation) {
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

