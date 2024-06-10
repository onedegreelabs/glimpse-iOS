//
//  ResendAlertView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/25/24.
//

import SwiftUI
import ComposableArchitecture
struct ResendAlertView: View {
    
    var body: some View {

        RoundedRectangle(cornerRadius: 4)
        
            .fill(Color(hex: "#D9D9D9"))
            .overlay(
                Text("You can only resend the verification code every 1 minute.")
                    .font(.pretendard(.regular, size: 12))
            )
            .frame(width: 344, height: 32)
    }
}
