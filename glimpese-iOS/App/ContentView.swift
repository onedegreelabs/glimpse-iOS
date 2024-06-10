//
//  ContentView.swift
//  glimpese-iOS
//
//  Created by 최지철 on 2023/12/17.
//

import SwiftUI
import ComposableArchitecture

enum Tab {
    case first
    case second
    case third
    case fourth
}

struct ContentView: View {
    @State var selectedTab: Tab
    @State private var isSideMenuPresented = false
    //MARK: To Do : ContentView feature 생성 수정중일 때 상태값때문 myprofile
    var body: some View {
        WithPerceptionTracking {
            ZStack {
                VStack {
                    CustomNaviBar(selectedTab: $selectedTab, isSideMenuPresented: $isSideMenuPresented, navigationText: "")
                    switch selectedTab {
                    case .first :
                        NavigationView {
                            HomeView()
                        }
                        
                    case .second:
                        NavigationView {
                            MyEventsView(store: Store(
                                initialState: MyEventsFeature.State(
                                    eventFloatingFeature: EventFloatingFeature.State(),
                                    eventData:  [], eventMode: .discover
                                )) {
                                    MyEventsFeature()
                                }, eventMode: .discover
                            )
                        }
                        
                    case .third:
                        NavigationView {
                            MyEventsView(store: Store(
                                initialState: MyEventsFeature.State(
                                    eventFloatingFeature: EventFloatingFeature.State(),
                                    eventData:  [], eventMode: .myevents
                                )) {
                                    MyEventsFeature()
                                }, eventMode: .myevents
                            )
                        }
                        
                    case .fourth:
                        
                        NavigationView {
                            MyEventsView(store: Store(
                                initialState: MyEventsFeature.State(
                                    eventFloatingFeature: EventFloatingFeature.State(),
                                    eventData:  [], eventMode: .myevents
                                )) {
                                    MyEventsFeature()
                                }, eventMode: .myevents
                            )
                        }
                    }
                    CustomTabBar(selectedTab: $selectedTab)
                        .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
    }
}

#Preview {
    ContentView(selectedTab: .first)
}
