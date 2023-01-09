import Foundation

public enum ZaiError: Error {
    case InputLengthNotEqual
    case EmptyBatch
    case BatchSizeLimitExceeded
    case BatchUpdateForbidden
    case InvalidUserId
    case InvalidItemId
    case InvalidItemIds
    case InvalidLimit
    case InvalidOffset
    case InvalidRecommendationType
    case InvalidEventType
    case InvalidEventValue
    case InvalidOptions
    case InvalidCustomEndpoint
    case NetworkError
}

extension ZaiError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .InputLengthNotEqual:
            return "All lists in input parameters must be of the same length."
        case .EmptyBatch:
            return "Cannot log empty EventBatch object."
        case .BatchSizeLimitExceeded:
            return "The number of items in event batch exceeded the size limit."
        case .BatchUpdateForbidden:
            return "EventBatch instance does not support updateEventLog operation."
        case .InvalidUserId:
            return "Length of user id must be between 1 and 500."
        case .InvalidItemId:
            return "Length of item id must be between 1 and 500."
        case .InvalidItemIds:
            return "Length of item ids must be between 0 and 10,000."
        case .InvalidLimit:
            return "Limit must be between 0 and 10,000."
        case .InvalidOffset:
            return "Offset must be between 0 and 10,000."
        case .InvalidRecommendationType:
            return "Length of recommendation type must be between 1 and 500."
        case .InvalidEventType:
            return "Length of event type must be between 1 and 500."
        case .InvalidEventValue:
            return "Length of event value must be between 1 and 500."
        case .InvalidOptions:
            return "Length of options must be between 0 and 1000."
        case .InvalidCustomEndpoint:
            return "Only alphanumeric characters of length up to 10 are allowed for custom endpoint."
        case .NetworkError:
            return "ZaiClient network connection failed."
        }
    }
}

extension ZaiError {
    public struct ClientError: Error {
        public var message: String?
        public var httpStatusCode: Int?
    }
}

