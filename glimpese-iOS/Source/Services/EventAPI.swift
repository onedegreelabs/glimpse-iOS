//
//  EventAPI.swift
//  glimpese-iOS
//
//  Created by KIM Hyung Jun on 1/25/24.
//

import Foundation
import Moya

enum EventAPI {
    
    // MARK: 내 이벤트 조회
    case getMyEvent(take: Int)
    
    // MARK: 이벤트 목록 조회
    case getEventList(take: Int)
    
    // MARK: 참가자 리스트 조회
    case getParticipants(eventId: Int)
    
    case getEventDetail(handle: String)
}

extension EventAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.glimpse.rsvp/v1")!
    }

    var path: String {
        switch self {
        case .getMyEvent:
            return "/events/my-events"
        case .getEventList:
            return "/events"
        case .getParticipants(let eventId):
            return  "/events/\(eventId)/participants"
        case .getEventDetail(let handle):
            return "/events/handle/\(handle) "
        }
    }

    var method: Moya.Method {
        switch self {
        case .getMyEvent, .getEventList, .getParticipants(_), .getEventDetail(_):
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getParticipants, .getEventDetail:
            return .requestPlain
            
        case .getMyEvent(take: let take):
            let params: [String: Any] = [
                "take": take
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
            
        case .getEventList(take: let take):
            let params: [String: Any] = [
                "take": take
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        let headers = ["Content-Type": "application/json"]
        return headers
    }
}
