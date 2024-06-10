//
//  LoginFeature.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/23/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct EnterCodeFeature {
    @ObservableState
    struct State {
        var loginInputFeature: LoginInputFeature.State?
        var textOtpFeature: TextOtpFeature.State?
        var resendAlertFeature: ResendAlertFeature.State?

        init(loginInputFeature: LoginInputFeature.State, textOtpFeature: TextOtpFeature.State, resendAlertFeature: ResendAlertFeature.State) {
            self.loginInputFeature = loginInputFeature
            self.textOtpFeature = textOtpFeature
            self.resendAlertFeature = resendAlertFeature
        }
    }
   
    enum Action {
        case loginInputFeature(LoginInputFeature.Action)
        case textOtpFeature(TextOtpFeature.Action)
        case resendAlertFeature(ResendAlertFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        
        Scope(state: \.loginInputFeature!, action: \.loginInputFeature) {
            LoginInputFeature()
        }
        Scope(state: \.textOtpFeature!, action: \.textOtpFeature) {
            TextOtpFeature()
        }
        Scope(state: \.resendAlertFeature!, action: \.resendAlertFeature) {
            ResendAlertFeature()
        }
        
        Reduce { state, action in
            switch action {
            case .loginInputFeature:
                return .none
            case .textOtpFeature:
                return .none
            case .resendAlertFeature:
                return .none
            }
       
        }
    }
    
}
