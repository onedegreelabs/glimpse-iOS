//
//  MyEvents.swift
//  glimpese-iOS
//
//  Created by 서원진 on 2024/03/13.
//

import SwiftUI
import ComposableArchitecture

struct MyEvents: View {
    let store: StoreOf<MyEventsFeature>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                ScrollView {
                    VStack {
                        MyEventListView()
                        
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    if let childStore = self.store.scope(state: \.eventFloatingFeature, action: \.eventFloatingFeature) {
                        EventFloatingView(store: childStore)
                    }
                    else {
                        Text("Nothing to show")
                    }
                }
                
            }
        }
    }
}

#Preview {
    MyEvents(store: Store(initialState: MyEventsFeature.State(
        eventFloatingFeature: EventFloatingFeature.State())) {
            MyEventsFeature()
        }
    )
}
