//
//  MyEventsFloatingView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/28/24.
//

import SwiftUI
import ComposableArchitecture

struct EventFloatingView: View {
    @Perception.Bindable var store: StoreOf<EventFloatingFeature>
    
    var body: some View {
        WithPerceptionTracking {
            Button {
                store.send(.floatingClicked)
            } label: {
                Image("Floating")
            }
//            .fullScreenCover(isPresented: $store.isFloatingClicked) {
//
//            }
        }
    }
}
