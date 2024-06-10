//
//  DiscoverClient.swift
//  glimpese-iOS
//
//  Created by 서원진 on 4/4/24.
//

import ComposableArchitecture
import Foundation
import Moya

@DependencyClient
struct DiscoverClient {
    var getEventList: @Sendable (_ take: Int) async throws -> [EventData]
}

extension DiscoverClient: DependencyKey {
    static let liveValue = Self(
        getEventList: { take in
            let provider = MoyaProvider<EventAPI>(plugins: [MoyaLoggingPlugin()])
            
            return try await withCheckedThrowingContinuation { continuation in
                provider.request(.getEventList(take: take)) { result in
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
    var discoverClient: DiscoverClient {
        get { self[DiscoverClient.self] }
        set { self[DiscoverClient.self] = newValue }
    }
}

