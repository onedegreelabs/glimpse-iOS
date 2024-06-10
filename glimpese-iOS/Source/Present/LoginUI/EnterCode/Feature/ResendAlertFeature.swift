//
//  ResendAlertFeature.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/25/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct ResendAlertFeature {
    @Dependency(\.loginClient) var loginClient
    @ObservableState
    struct State: Equatable {
        var alertState: Bool = false
    }
    
    enum Action {
        case trueState
        case falseState
        case resendEmailCode
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .trueState:
                state.alertState = true
                return .none
            case .falseState:
                state.alertState = false
                return .none
            case .resendEmailCode:
                return .run { send in
                    if let userEmail = UserDefaults.standard.string(forKey: "userEmail") {
                        _ = try await loginClient.sendMailCode(email: userEmail)
                    }
                }
            }
        }
    }
}
