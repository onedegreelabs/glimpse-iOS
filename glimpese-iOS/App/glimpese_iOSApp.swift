//
//  glimpese_iOSApp.swift
//  glimpese-iOS
//
//  Created by 최지철 on 2023/12/17.
//

import SwiftUI
import ComposableArchitecture
@main
struct glimpese_iOSApp: App {
    var body: some Scene {
        WithPerceptionTracking {
            WindowGroup {
                SplashScreenView(store: Store(
                    initialState:
                        SplashScreenFeature.State()) {
                            SplashScreenFeature()
                        }
                )
            }
        }
    }
}
