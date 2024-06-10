//
//  MenuItemView.swift
//  glimpese-iOS
//
//  Created by KIM Hyung Jun on 1/24/24.
//

import SwiftUI

struct MenuItemView: View {
    let iconName: String
    let title: String
    var action: () -> Void = {}
    
    var body: some View {
        HStack(spacing: 13) {
            Button(action: action) {
                HStack {
                    Image(iconName)
                        .frame(width: 24, height: 24)
                    Text(title)
                        .foregroundColor(.black)
                        .font(.pretendard(.regular, size: 16))
                }
            }
            
        }
        .padding(.top, 30)
        .padding(.leading, 30)
    }
}
