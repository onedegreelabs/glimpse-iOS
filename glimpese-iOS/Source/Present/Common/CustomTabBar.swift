//
//  CustomTabBar.swift
//  glimpese-iOS
//
//  Created by 최지철 on 2023/12/21.
//

import SwiftUI
import ComposableArchitecture

// MARK: 커스텀 탭바

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        WithPerceptionTracking {
            ZStack {
                HStack(spacing: 45) {
                    
                    Button {
                        selectedTab = .first
                    } label: {
                        CustomTabBarItem(imageName: selectedTab == .first ? "Home-Selected" : "Home", title: "Home", isSelected: selectedTab == .first)
                    }
                    
                    Button {
                        selectedTab = .second
                    } label: {
                        CustomTabBarItem(imageName: selectedTab == .second ? "Discover-Selected" : "Discover", title: "Discover", isSelected: selectedTab == .second)
                    }
                    
                    Button {
                        selectedTab = .third
                    } label: {
                        CustomTabBarItem(imageName: selectedTab == .third ? "Calendar-Selected" : "Calendar", title: "My Events", isSelected: selectedTab == .third)
                    }
                    
                    Button {
                        selectedTab = .fourth
                    } label: {
                        CustomTabBarItem(imageName: selectedTab == .fourth ? "Contacts-Selected" : "Contacts", title: "My Profile", isSelected: selectedTab == .fourth)
                    }
                }
                
            }
            .frame(width: UIScreen.main.bounds.width, height: 52)
            .background(.white.opacity(0.5))
            .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 2)
        }
    }
}


struct CustomTabBarItem: View {
    var imageName: String
    var title: String
    var isSelected: Bool
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 32, height: 32)
                    
                    Image(imageName)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                
                Text(title)
                    .font(.pretendard(.regular, size:  13))
                    .foregroundColor(isSelected ? Color(hex: "#7E51FD") : .primary)
            }
            .padding(.top, 5)
        }
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(Tab.first))
}
