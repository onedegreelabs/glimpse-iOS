//
//  MyEvents.swift
//  glimpese-iOS
//
//  Created by 서원진 on 2024/03/13.
//

import SwiftUI
import ComposableArchitecture

struct MyEventsView: View {
    let store: StoreOf<MyEventsFeature>
    let eventMode: EventMode
    var body: some View {
        WithPerceptionTracking {
            ZStack {
                ScrollView {
                    VStack {
                        if store.isLoading {
                            ProgressView()
                        } else {
                            MyEventListView(store: Store(
                                initialState: MyEventsFeature.State(
                                    eventFloatingFeature: EventFloatingFeature.State(),
                                    eventData: [], eventMode: eventMode
                                )) {
                                    MyEventsFeature()
                                }
                            )
                        }
                    }
                }
                
                if !store.isLoading {
                    if store.eventData.isEmpty {
                        EmptyEventView(store: Store(
                            initialState: EventFloatingFeature.State()) {
                                EventFloatingFeature()
                            }
                        )
                    } else {
                        VStack {
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
        }.onAppear {
            store.send(.onAppear)
        }
    }
}
