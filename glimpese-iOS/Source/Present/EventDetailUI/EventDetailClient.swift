//
//  EventDetailClient.swift
//  glimpese-iOS
//
//  Created by 서원진 on 4/9/24.
//

import ComposableArchitecture
import Foundation
import Moya
@DependencyClient
struct EventDetailClient {
    var getEvenDetail: @Sendable (_ handle: String) async throws -> [EventDetailData]
    var getParticipant: @Sendable (_ eventId: Int) async throws -> [ParticipantData]
}

extension EventDetailClient: DependencyKey {
    static let liveValue = Self(
        getEvenDetail: { handle in
            let provider = MoyaProvider<EventAPI>(plugins: [MoyaLoggingPlugin()])
        
            return try await withCheckedThrowingContinuation { continuation in
                provider.request(.getEventDetail(handle: handle)) { result in
                    switch result {
                    case let .success(response):
                        do {
                            let eventDetail = try JSONDecoder().decode(GetEventByHanleDto.self, from: response.data)
                            continuation.resume(returning: eventDetail.data)
                        } catch {
                            print("디코딩 실패: \(error)")
                            continuation.resume(throwing: error)
                        }
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        },
        getParticipant: { eventId in
            let provider = MoyaProvider<EventAPI>(plugins: [MoyaLoggingPlugin()])
            return try await withCheckedThrowingContinuation { continuation in
                provider.request(.getParticipants(eventId: eventId)) { result in
                    switch result {
                    case let .success(response):
                        do {
                            let eventDetail = try JSONDecoder().decode(GetParticipantDto.self, from: response.data)
                            continuation.resume(returning: eventDetail.data)
                        } catch {
                            print("디코딩 실패: \(error)")
                            continuation.resume(throwing: error)
                        }
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    )
}

extension DependencyValues {
    var eventDetailClient: EventDetailClient {
        get { self[EventDetailClient.self] }
        set { self[EventDetailClient.self] = newValue }
    }
}
