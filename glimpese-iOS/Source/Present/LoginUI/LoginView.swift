//
//  LoginView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/21/24.
//

import SwiftUI
import ComposableArchitecture

struct LoginView: View {
    var body: some View {
        WithPerceptionTracking {
            VStack {
                IconView()
                Spacer().frame(height: 30)
                VStack {
                    LoginHeaderView()
                    Spacer().frame(height: 16)
                    LoginInputView(store: Store(
                        initialState:
                            LoginInputFeature.State()) {
                                LoginInputFeature()
                            }
                    )
                    Spacer().frame(height: 30)
                }.modifier(CustomWrapperModifier(width: 335, height: 283))
            }
            Spacer().frame(height: 100)
        }
    }
}

#Preview {
    LoginView()
}
