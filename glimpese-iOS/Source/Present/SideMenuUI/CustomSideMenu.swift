//
//  CustomSideMenu.swift
//  glimpese-iOS
//
//  Created by KIM Hyung Jun on 1/23/24.
//

import SwiftUI
import ComposableArchitecture

enum MenuOption: String, Identifiable {
    var id: String { self.rawValue }
    
    case profile = "My Profile"
    case discover = "Discover"
    case myEvents = "My Events"
    case settings = "Settings"
    case feedback = "Share Feedback"
    case support = "Customer Service"
    case none
}

struct CustomSideMenu: View {
    @Binding var isSideMenuPresented: Bool
    @State private var isLogoutAlertPresented = false
    @State private var selectedMenuOption:  MenuOption? = nil
    
    var body: some View {
        WithPerceptionTracking {
            ZStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hi, Glimpse 👋")
                            .foregroundColor(.black)
                            .font(.pretendard(.semibold, size: 16))
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Button(action: {
                            isSideMenuPresented = false
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .imageScale(.large)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 55)
                    
                    MenuItemView(iconName: "Contacts", title: "My Profile") {
                        selectedMenuOption = .profile
                    }
                    customDivider(height: 3)
                    
                    MenuItemView(iconName: "Discover", title: "Discover") {
                        selectedMenuOption = .discover
                    }
                    MenuItemView(iconName: "Calendar", title: "My Events") {
                        selectedMenuOption = .myEvents
                    }
                    customDivider(height: 3)
                    
                    MenuItemView(iconName: "Setting", title: "Settings") {
                        selectedMenuOption = .settings
                    }
                    MenuItemView(iconName: "Talk", title: "Share Feedback") {
                        selectedMenuOption = .feedback
                    }
                    MenuItemView(iconName: "Bag", title: "Customer Service") {
                        selectedMenuOption = .support
                    }
                    
                    HStack {
                        Text("Sign Info")
                            .foregroundColor(.black)
                            .font(.pretendard(.semibold, size: 16))
                        
                        Spacer()
                        if let userEmail = UserDefaults.standard.string(forKey: "userEmail") {
                            Text(userEmail)
                                .foregroundColor(Color(hex: "868686"))
                                .font(.pretendard(.regular, size: 16))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    .padding([.leading, .trailing], 10)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            print("Logout Button Tapped")
                            isLogoutAlertPresented = true
                        }) {
                            Text("Log Out")
                                .font(.pretendard(.regular, size: 17))
                                .foregroundColor(Color(hex: "d6d6d6"))
                        }
                        .padding([.top, .trailing], 25)
                    }
                    
                    Spacer()
                }
                
                if isLogoutAlertPresented {
                    CustomLogoutAlertView(isPresented: $isLogoutAlertPresented)
                }
            }
            .fullScreenCover(item: $selectedMenuOption) { option in
                switch option {
                case .profile:
                    ContentView(selectedTab: .fourth)
                        .transaction { transaction in
                            transaction.disablesAnimations = true
                        }
                case .discover:
                    ContentView(selectedTab: .second)
                        .transaction { transaction in
                            transaction.disablesAnimations = true
                        }
                case .myEvents:
                    ContentView(selectedTab: .third)
                        .transaction { transaction in
                            transaction.disablesAnimations = true
                        }
                case .settings:
                    EmptyView()
                case .feedback:
                    EmptyView()
                case .support:
                    EmptyView()
                case .none:
                    EmptyView()
                }
            }
        }
        .fullScreenCover(item: $selectedMenuOption) { option in
            switch option {
            case .profile:
                ContentView(selectedTab: .fourth)
            case .discover:
                ContentView(selectedTab: .second)
            case .myEvents:
                ContentView(selectedTab: .third)
            case .settings:
                EmptyView()
            case .feedback:
                EmptyView()
            case .support:
                EmptyView()
            case .none:
                EmptyView()
            }
        }
        .transaction { transaction in
            transaction.disablesAnimations = true
        }
    }
}
