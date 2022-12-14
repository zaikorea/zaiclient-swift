//  Copyright © 2022 CocoaPods. All rights reserved.

import Quick
import Nimble
import zaiclient
import AWSDynamoDB
import AWSCore

let clientId: String = "test"
let clientSecret: String = "KVPzvdHTPWnt0xaEGc2ix-eqPXFCdEV5zcqolBr_h1k"

let awsCredentials = AWSStaticCredentialsProvider(accessKey: Bundle.main.object(forInfoDictionaryKey: "ACCESS_KEY") as! String, secretKey: Bundle.main.object(forInfoDictionaryKey: "SECRET_KEY") as! String)
let dynamodb = AWSDynamoDB.default()

public func generateUUID() -> String {
    return UUID().uuidString
}

public func generateRandomInt(min: Int, max: Int) -> Int {
    return Int.random(in: min..<max)
}

public func generateRandomDouble(min: Double, max: Double) -> Double {
    return Double.random(in: min...max)
}

public func generatePageType() -> String {
    let products = ["homepage", "category", "today's pick"]
    return products.randomElement()!
}

public func generateQuery() -> String {
    let queries = ["waterproof camera", "headphones with NAC", "book for coding"]
    return queries.randomElement()!
}

public func generateOptions(n: Int) -> [String: String] {
    var options: [String: String] = [:]
    for i in 1...n {
        options["key\(i)"] = String(generateRandomInt(min: 0, max: 10))
    }
    return options
}

public func checkSuccessfulEventAdd(event: BaseEvent?, completionHandler: @escaping (_ response: Bool?,_ error: Error?) -> ()) {
    AWSServiceManager.default().defaultServiceConfiguration = AWSServiceConfiguration(region: .APNortheast2, credentialsProvider: awsCredentials)
    let queryInput = AWSDynamoDBQueryInput()
    queryInput?.tableName = "events_\(clientId)"
    
    let condition = AWSDynamoDBCondition()
    condition?.comparisonOperator = AWSDynamoDBComparisonOperator.EQ
    
    let events = event?.getPayload()
    
    let keyVal = AWSDynamoDBAttributeValue()
    keyVal?.s = events![0].userId
    condition?.attributeValueList = [keyVal!]
    let expression = ["user_id": condition!]
    queryInput?.keyConditions = expression
    
    do {
        let zaiClient = try ZaiClient(zaiClientID: clientId, zaiSecret: clientSecret)

        zaiClient.addEventLog(event!) {
            (res, error) in if let response = res {
                
                expect(response.failureCount).to(equal(0))
                
                if events?.count == 1 {
                    let e = events![0]
                    dynamodb.query(queryInput!) {
                        (ddbRes, ddbError) in if let ddbResponse = ddbRes {
                            expect(ddbResponse.items![0]["event_value"]?.s).to(equal(e.eventValue))
                            expect(ddbResponse.items![0]["event_type"]?.s).to(equal(e.eventType))

                            let deleteInput = AWSDynamoDBDeleteItemInput()
                            deleteInput?.tableName = "events_\(clientId)"
                            deleteInput?.key = ["user_id": keyVal!, "timestamp": ddbResponse.items![0]["timestamp"]!]
                            dynamodb.deleteItem(deleteInput!) {
                                (res, err) in if let error = err {
                                    print(error.localizedDescription)
                                    fail()
                                }
                            }
                            completionHandler(true, nil)
                        } else {
                            fail()
                        }
                    }
                    
                } else {
                    dynamodb.query(queryInput!) {
                        (ddbRes, ddbError) in if let ddbResponse = ddbRes {
                            expect(ddbResponse.items?.count).to(equal(events?.count))
                            
                            for res in ddbResponse.items! {
                                expect(res["event_type"]?.s).to(equal(events![0].eventType))
                                
                                let deleteInput = AWSDynamoDBDeleteItemInput()
                                deleteInput?.tableName = "events_\(clientId)"
                                deleteInput?.key = ["user_id": keyVal!, "timestamp": res["timestamp"]!]
                                dynamodb.deleteItem(deleteInput!) {
                                    (res, err) in if let error = err {
                                        print(error.localizedDescription)
                                        fail()
                                    }
                                }
                                
                                completionHandler(true, nil)
                            }
                        } else {
                            fail()
                        }
                    }
                }
            } else {
                fail()
            }
        }
    } catch let error {
        fail()
        print(error)
    }
}

public func checkSuccessfulEventUpdate(event: BaseEvent?, newEvent: BaseEvent?, completionHandler: @escaping (_ response: Bool?,_ error: Error?) -> ()) {
    
    AWSServiceManager.default().defaultServiceConfiguration = AWSServiceConfiguration(region: .APNortheast2, credentialsProvider: awsCredentials)
    let queryInput = AWSDynamoDBQueryInput()
    queryInput?.tableName = "events_\(clientId)"
    
    let condition = AWSDynamoDBCondition()
    condition?.comparisonOperator = AWSDynamoDBComparisonOperator.EQ
    
    let events = event?.getPayload()
    let newEvents = newEvent?.getPayload()
    
    let keyVal = AWSDynamoDBAttributeValue()
    keyVal?.s = events![0].userId
    condition?.attributeValueList = [keyVal!]
    let expression = ["user_id": condition!]
    queryInput?.keyConditions = expression
    
    do {
        let zaiClient = try ZaiClient(zaiClientID: clientId, zaiSecret: clientSecret)

        zaiClient.addEventLog(event!) {
            (res, error) in if let response = res {
                
                expect(response.failureCount).to(equal(0))
                
                if events?.count == 1 {
                    let e = events![0]
                    dynamodb.query(queryInput!) {
                        (ddbRes, ddbError) in if let ddbResponse = ddbRes {
                            expect(ddbResponse.items![0]["item_id"]?.s).to(equal(e.itemId))
                            expect(ddbResponse.items![0]["event_value"]?.s).to(equal(e.eventValue))
                            expect(ddbResponse.items![0]["event_type"]?.s).to(equal(e.eventType))
                            
                            do {
                                try zaiClient.updateEventLog(newEvent!) {
                                    (res, error) in if let response = res {
                                        expect(response.failureCount).to(equal(0))
                                        
                                        let e = newEvents![0]
                                        dynamodb.query(queryInput!) {
                                            (ddbRes, ddbError) in if let ddbResponse = ddbRes {
                                                expect(ddbResponse.items![0]["item_id"]?.s).to(equal(e.itemId))
                                                expect(ddbResponse.items![0]["event_value"]?.s).to(equal(e.eventValue))
                                                expect(ddbResponse.items![0]["event_type"]?.s).to(equal(e.eventType))
                                                
                                                let deleteInput = AWSDynamoDBDeleteItemInput()
                                                deleteInput?.tableName = "events_\(clientId)"
                                                deleteInput?.key = ["user_id": keyVal!, "timestamp": ddbResponse.items![0]["timestamp"]!]
                                                dynamodb.deleteItem(deleteInput!) {
                                                    (res, err) in if let error = err {
                                                        print(error.localizedDescription)
                                                        fail()
                                                    }
                                                }
                                                
                                                completionHandler(true, nil)
                                            } else {
                                                fail()
                                            }
                                        }
                                    }
                                }
                            } catch {
                                fail()
                            }
                        } else {
                            fail()
                        }
                    }
                    
                }
            } else {
                fail()
            }
        }
    } catch let error {
        fail()
        print(error)
    }
}

public func checkSuccessfulEventDelete(event: BaseEvent?, completionHandler: @escaping (_ response: Bool?,_ error: Error?) -> ()) {
    
    AWSServiceManager.default().defaultServiceConfiguration = AWSServiceConfiguration(region: .APNortheast2, credentialsProvider: awsCredentials)
    let queryInput = AWSDynamoDBQueryInput()
    queryInput?.tableName = "events_\(clientId)"
    
    let condition = AWSDynamoDBCondition()
    condition?.comparisonOperator = AWSDynamoDBComparisonOperator.EQ
    
    let events = event?.getPayload()
    
    let keyVal = AWSDynamoDBAttributeValue()
    keyVal?.s = events![0].userId
    condition?.attributeValueList = [keyVal!]
    let expression = ["user_id": condition!]
    queryInput?.keyConditions = expression
    
    do {
        let zaiClient = try ZaiClient(zaiClientID: clientId, zaiSecret: clientSecret)

        zaiClient.addEventLog(event!) {
            (res, error) in if let response = res {
                
                expect(response.failureCount).to(equal(0))
                
                if events?.count == 1 {
                    let e = events![0]
                    dynamodb.query(queryInput!) {
                        (ddbRes, ddbError) in if let ddbResponse = ddbRes {
                            expect(ddbResponse.items![0]["item_id"]?.s).to(equal(e.itemId))
                            expect(ddbResponse.items![0]["event_value"]?.s).to(equal(e.eventValue))
                            expect(ddbResponse.items![0]["event_type"]?.s).to(equal(e.eventType))
                            
                            zaiClient.deleteEventLog(event!) {
                                (res, error) in if let response = res {
                                    expect(response.failureCount).to(equal(0))
                                    
                                    dynamodb.query(queryInput!) {
                                        (ddbRes, ddbError) in if let ddbResponse = ddbRes {
                                            expect(ddbResponse.items?.count).to(equal(0))
                                            completionHandler(true, nil)
                                        } else {
                                            fail()
                                        }
                                    }
                                }
                            }
                        } else {
                            fail()
                        }
                    }
                    
                }
            } else {
                fail()
            }
        }
    } catch let error {
        print(error)
        fail()
    }
}

func convertToDictionary(_ text: String?) -> [String: String]? {
    if let data = text!.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: String]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

struct Metadata: Decodable {
    var userId: String?
    var itemId: String?
    var itemIds: [String]?
    var limit: Int
    var offset: Int
    var options: [String: String]?
    var recommendationType: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case itemId = "item_id"
        case itemIds = "item_ids"
        case limit = "limit"
        case offset = "offset"
        case options = "options"
        case recommendationType = "recommendation_type"
    }
}

public func checkSuccessfulRecommendation(recommendation: RecommendationRequest?, completionHandler: @escaping (_ response: Bool?,_ error: Error?) -> ()) {
    do {
        let zaiClient = try ZaiClient(zaiClientID: clientId, zaiSecret: clientSecret)

        zaiClient.getRecommendations(recommendation!) {
            (res, err) in if let response = res {
                let metadata = try? JSONDecoder().decode(Metadata.self, from: response.metadata.data(using: .utf8)!)
                expect(response.count).to(equal(recommendation?.limit))
                expect(response.items.count).to(equal(recommendation?.limit))
                
                expect((metadata?.recommendationType)).to(equal(recommendation?.recommendationType))
                expect((metadata?.offset)).to(equal(recommendation?.offset))
                if let options = recommendation?.options {
                    let _options = try! JSONSerialization.jsonObject(with: Data(options.utf8), options: []) as? [String: Any]
                    let metadataOptions = metadata?.options
                    expect(metadataOptions! as NSDictionary).to(equal(_options as! NSDictionary))
                } else {
                    expect(recommendation?.options).to(beNil())
                }
                
                completionHandler(true, nil)
            } else {
                fail()
            }
        }
    } catch let error {
        print(error)
        fail()
    }
}
