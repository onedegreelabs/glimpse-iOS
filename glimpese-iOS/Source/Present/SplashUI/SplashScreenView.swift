//
//  SplashView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/20/24.
//

import SwiftUI
import ComposableArchitecture

struct SplashScreenView: View {
    
    let store: StoreOf<SplashScreenFeature>
    
    @State private var showMainScreen = false
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
            .onAppear {
                store.send(.checkLoginStatus)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    showMainScreen = true
                }
            }
            .fullScreenCover(isPresented: $showMainScreen) {
                if store.isLoggedIn {
                    ContentView(selectedTab: .first)
                } 
                else {
                    LoginView()
                }
            }
            .transaction { transaction in
                transaction.disablesAnimations = true
            }
        }
    }
}
