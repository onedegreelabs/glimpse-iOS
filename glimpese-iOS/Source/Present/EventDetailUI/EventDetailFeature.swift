//
//  EventDetailFeature.swift
//  glimpese-iOS
//
//  Created by 서원진 on 4/9/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct EventDetailFeature {
    @Dependency(\.eventDetailClient) var eventDetailClient
    
    @ObservableState
    struct State {
        var handle: String
        var eventDetailData: [EventDetailData]
        var isLoading: Bool = true
        var participantData: [ParticipantData]
        
        var eventInfoFeature: EventInfoFeature.State?
        
        init(handle: String,eventDetailData: [EventDetailData], participantData: [ParticipantData], eventInfoFeature: EventInfoFeature.State) {
            self.handle = handle
            self.eventDetailData = eventDetailData
            self.participantData = participantData
            self.eventInfoFeature = eventInfoFeature
        }
    }
    enum Action {
        case getEventDetail
//        case getParticipant
        case fetchEventDetailResponse(Result<[EventDetailData], Error>)
//        case fetchParticipantResponse(Result<[ParticipantData], Error>)
        case loadingFalse
        case eventInfoFeature(EventInfoFeature.Action)
    }
    var body: some ReducerOf<Self> {
        Scope(state: \.eventInfoFeature!, action: \.eventInfoFeature) {
            EventInfoFeature()
        }
        Reduce { state, action in
            switch action {
            case .getEventDetail:
                let handle = state.handle
                return .run { send in
                    do {
                        let response = try await eventDetailClient.getEvenDetail(handle: handle)
                        await send(.fetchEventDetailResponse(.success(response)))
                        await send(.loadingFalse)
                    } catch {
                        await send(.fetchEventDetailResponse(.failure(error)))
                    }
                }
                
            case let .fetchEventDetailResponse(.success(eventDetail)):
                state.eventDetailData = eventDetail
                return .none
                
            case .fetchEventDetailResponse(.failure):
                print("이벤트를 가져오는 중 오류가 발생했습니다.")
                return .none
            case .loadingFalse:
                state.isLoading = false
                return .none
                
//            case let .fetchParticipantResponse(_):
//                <#code#>
//            case .getParticipant:
//                <#code#>
            case .eventInfoFeature(_):
                return .none
            }
        }
    }
}
