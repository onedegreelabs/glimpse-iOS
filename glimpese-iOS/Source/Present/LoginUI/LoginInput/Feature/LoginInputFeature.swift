//
//  LoginInputFeature.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/23/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct LoginInputFeature {
    @Dependency(\.loginClient) var loginClient
    
    @ObservableState
    struct State: Equatable {
        var emailAddress: String
        var isPresented: Bool = false
        
        init() {
            emailAddress = ""
        }
        
        init(emailAddress: String) {
            self.emailAddress = emailAddress
        }
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case signButtonClicked
        case emailCheked(String)
        case requestSever
        case onTapGesture
        
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .signButtonClicked:
                state.isPresented.toggle()
                return .none
                
            case .emailCheked(let emailAddress):
                state.emailAddress = emailAddress
                return .none
    
            case .binding(_):
                return .none

            case .requestSever:
                let email = state.emailAddress
                return .run { send in
                   _ = try await loginClient.sendMailCode(email: email)
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
