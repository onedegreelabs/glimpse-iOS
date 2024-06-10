//
//  EventInfoFeature.swift
//  glimpese-iOS
//
//  Created by 서원진 on 4/9/24.
//

import SwiftUI
import ComposableArchitecture
@Reducer
struct EventInfoFeature {
    @ObservableState
    struct State: Equatable {
        var isExpanded: Bool = false
    }
    enum Action {

        case moreClicked
    }
    
    var body: some ReducerOf<Self> {
       Reduce { state, action in
            switch action {
            case .moreClicked:
                state.isExpanded.toggle()
                return .none
            }
        }
    }
}
