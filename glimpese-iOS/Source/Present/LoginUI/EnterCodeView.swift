//
// EnterCodeView.swift
// glimpese-iOS
//
// Created by 서원진 on 3/23/24.
//
import SwiftUI
import ComposableArchitecture
struct EnterCodeView: View {
  @Perception.Bindable var store: StoreOf<EnterCodeFeature>
  @State var isPresented: Bool = false
  var body: some View {
    WithPerceptionTracking {
      VStack {
        IconView()
        Spacer().frame(height: 40)
        VStack {
          if let childStore = self.store.scope(state: \.loginInputFeature, action: \.loginInputFeature) {
            HeaderView(store: childStore)
          }
          else {
            Text("Nothing to show")
          }
          if let childStore = self.store.scope(state: \.textOtpFeature, action: \.textOtpFeature) {
            TextOtpView(store: childStore)
            if childStore.statusCode == 401 {
              DiscordOTPView()
            }
          }
          else {
            Text("Nothing to show")
          }
          Spacer().frame(height: 48)
          if let childStore = self.store.scope(state: \.resendAlertFeature, action: \.resendAlertFeature) {
            TimerResendCodeView(store: childStore)
          }
          else {
            Text("Nothing to show")
          }
        }
        .modifier(CustomWrapperModifier(width: 335, height: 300))
      }
      .fullScreenCover(isPresented: $isPresented) {
            HomeView()
      }
      .transaction { transaction in
          transaction.disablesAnimations = true
      }
      .padding(.top, -130)
      if let childStore = self.store.scope(state: \.resendAlertFeature, action: \.resendAlertFeature) {
        if childStore.state.alertState {
          ResendAlertView()
            .onAppear {
              DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                childStore.send(.falseState)
              }
            }
        }
      }
      else {
        Text("Nothing to show")
      }
    }
  }
}
#Preview {
  EnterCodeView(store: Store(
    initialState:
      EnterCodeFeature.State(loginInputFeature: LoginInputFeature.State(), 
                             textOtpFeature: TextOtpFeature.State(),
                             resendAlertFeature: ResendAlertFeature.State())) {
        EnterCodeFeature()
      }
  )
}
