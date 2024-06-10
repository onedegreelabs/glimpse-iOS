//
//  MyEventsFeature.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/28/24.
//

import SwiftUI
import ComposableArchitecture

enum EventMode {
    case discover
    case myevents
}

@Reducer
struct MyEventsFeature {
    @Dependency(\.myEventClient) var myEventClitent
    @Dependency(\.discoverClient) var discoverClient
    @Dependency(\.mainQueue) var mainQueue
   
    @ObservableState
    struct State {
        var eventFloatingFeature: EventFloatingFeature.State?
        var eventData: [EventData]
        var isLoading: Bool = true
        var eventMode: EventMode
        init(eventFloatingFeature: EventFloatingFeature.State, eventData: [EventData], eventMode: EventMode) {
            self.eventFloatingFeature = eventFloatingFeature
            self.eventData = eventData
            self.eventMode = eventMode
        }
    }
    
    enum Action {
        case onAppear
        case eventFloatingFeature(EventFloatingFeature.Action)
        case fetchEventsResponse(Result<[EventData], Error>)
        case loadingFalse
    }
    var body: some ReducerOf<Self> {
        Scope(state: \.eventFloatingFeature!, action: \.eventFloatingFeature) {
            EventFloatingFeature()
        }
        Reduce { state, action in
            switch action {
            case .eventFloatingFeature:
                return .none
                
            case .onAppear:
                switch state.eventMode {
                case .discover:
                    return .run { send in
                        do {
                            let response = try await discoverClient.getEventList(10)
                            await send(.fetchEventsResponse(.success(response)))
                            await send(.loadingFalse)
                        } catch {
                            await send(.fetchEventsResponse(.failure(error)))
                        }
                    }
                case .myevents:
                    return .run { send in
                        do {
                            let response = try await myEventClitent.getMyEvent(10)
                            await send(.fetchEventsResponse(.success(response)))
                            await send(.loadingFalse)
                        } catch {
                            await send(.fetchEventsResponse(.failure(error)))
                        }
                    }
                }
                
            case let .fetchEventsResponse(.success(events)):
                state.eventData = events
                return .none
                
            case .fetchEventsResponse(.failure):
                print("이벤트를 가져오는 중 오류가 발생했습니다.")
                return .none
                
            case .loadingFalse:
                state.isLoading = false
                return .none
            }
        }
    }
}
