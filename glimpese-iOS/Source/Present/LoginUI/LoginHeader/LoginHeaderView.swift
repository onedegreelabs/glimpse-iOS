//
//  LoginHeaderView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/21/24.
//

import SwiftUI

struct LoginHeaderView: View {
    var body: some View {
            VStack(spacing: 16) {
                Text("Welcome to glimpse!")
                    .font(.pretendard(.regular, size: 24))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.top,20)
                
                Text("Create a profile card to interact with participants!")
                    .font(.pretendard (.regular, size: 12))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
            }
        
    }
}
