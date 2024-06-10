//
//  SplashScreenFeature.swift
//  glimpese-iOS
//
//  Created by 서원진 on 4/10/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct SplashScreenFeature {
    @Dependency(\.loginClient) var loginClient
    
    @ObservableState
    struct State: Equatable {
        var  isLoggedIn: Bool = false
    }
    
    enum Action {
        case checkLoginStatus
        case taskResult(Int)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .checkLoginStatus:
                return .run { send in
                    let response = try await loginClient.tokenReIssue()
                    await send(.taskResult(response))
                }
                
            case .taskResult(let result):
                switch result {
                case 200:
                    state.isLoggedIn = true
                    print("리프레쉬 토큰 유효 O")
                case 401:
                    state.isLoggedIn = false
                    print("리프레쉬 토큰 유효 X")
                default:
                    return  .none
                }
                return .none
            }
        }
        
    }
    
}
