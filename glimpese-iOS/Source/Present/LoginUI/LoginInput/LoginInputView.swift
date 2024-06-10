//
//  TextFieldView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/21/24.
//

import SwiftUI
import ComposableArchitecture

struct LoginInputView: View {
    @Perception.Bindable var store: StoreOf<LoginInputFeature>
    @State var isInvalidEmail: Bool = false
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                // MARK: To Do placeholder 수정
                TextField("email address", text: $store.emailAddress.sending(\.emailCheked))
                    .frame(width: 294, height: 44)
                    .font(.pretendard(.regular, size: 16))
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(isInvalidEmail ? Color.red : Color(hex: "#D9D9D9"), lineWidth: 1)
                    )
                    .textFieldStyle(PlainTextFieldStyle())
                
                if isInvalidEmail {
                    ErrorAlertView()
                }
                
                Spacer().frame(height: 36)
                
                Button {
                    if isValidEmail(store.emailAddress) {
                        store.send(.signButtonClicked)
                        store.send(.requestSever)
                    } else {
                        isInvalidEmail = true
                    }
                } label: {
                    Image("sign button")
                }
                .fullScreenCover(isPresented: $store.isPresented) {
                    EnterCodeView(store: Store(
                        initialState: EnterCodeFeature.State(
                            loginInputFeature: LoginInputFeature.State(emailAddress: store.emailAddress),textOtpFeature: TextOtpFeature.State(), resendAlertFeature: ResendAlertFeature.State())) {
                            EnterCodeFeature()
                        }
                    )
                }
                .transaction { transaction in
                    transaction.disablesAnimations = true
                }
            }
        }
        .onTapGesture {
            store.send(.onTapGesture)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}


