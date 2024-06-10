//
//  EventFloatingFeature.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/28/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct EventFloatingFeature {
    @ObservableState
    struct State: Equatable {
        var isFloatingClicked: Bool = false
    }
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case floatingClicked
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .floatingClicked:
                state.isFloatingClicked.toggle()
                return .none
            case .binding(_):
                return .none
            }
        }
    }
}
