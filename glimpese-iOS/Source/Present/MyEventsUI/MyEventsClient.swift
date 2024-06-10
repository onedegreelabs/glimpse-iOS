//
//  MyEventManager.swift
//  glimpese-iOS
//
//  Created by 서원진 on 4/1/24.
//

import ComposableArchitecture
import Foundation
import Moya

@DependencyClient
struct MyEventsClient {
    var getMyEvent: @Sendable (_ take: Int) async throws -> [EventData]
}

extension MyEventsClient: DependencyKey {
    static let liveValue = Self(
        getMyEvent: { take in
            let provider = MoyaProvider<EventAPI>(plugins: [MoyaLoggingPlugin()])

            return try await withCheckedThrowingContinuation { continuation in
                provider.request(.getMyEvent(take: take)) { result in
                    switch result {
                    case let .success(response):
                        do {
                            let event = try JSONDecoder().decode(GetEventDto.self, from: response.data)
                            continuation.resume(returning: event.data)
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
    var myEventClient: MyEventsClient {
        get { self[MyEventsClient.self] }
        set { self[MyEventsClient.self] = newValue }
    }
}

