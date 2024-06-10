//
//  EnterCodeFeature.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/23/24.
//

// TextOtpFeature.swift

import SwiftUI
import ComposableArchitecture
import Moya

@Reducer
struct TextOtpFeature {
    @Dependency(\.loginClient) var loginClient
    
    @ObservableState
    struct State: Equatable {
        var otpText: String = ""
        var enterState: Bool = false
        var isPresented: Bool = false
        var statusCode: Int = 0
        var alertState: Bool = false
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case otpTextChanged(String)
        case enterClicked
        case requestSever(String)
        case taskResult(Int)
        case loginFailure(Error)
        case onTapGesture
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .otpTextChanged(let otpText):
                state.otpText = otpText
                return .none
                
            case .enterClicked:
                state.otpText = ""
                return .none
                
            case .taskResult(let result):
                switch result {
                case 401:
                    state.statusCode = 401
                    state.alertState = true
                case 200:
                    state.statusCode = 200
                    state.isPresented = true
                default:
                    state.statusCode = 0
                }
                return .none
                
            case .loginFailure(let error):
                print("Login failed: \(error.localizedDescription)")
                return .none
                
            case .binding(_):
                return .none
                
            case .requestSever:
                let otpText = state.otpText
                return .run { send in
                    do {
                        let response = try await loginClient.login(otpText: otpText)
                        await send(.taskResult(response))
                    } catch {
                        await send(.loginFailure(error))
                    }
                }
            
            case .onTapGesture:
                UIApplication.shared.sendAction(
                    #selector(UIResponder.resignFirstResponder),
                    to: nil, from: nil, for: nil)
                return .none
            }
        }
    }
}
