//
//  DiscordOTPView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/23/24.
//

import SwiftUI

struct DiscordOTPView: View {
    var body: some View {
        HStack {
            Image("Warning")
            Text("The authentication number is incorrect.")
                .font(.pretendard(.regular, size: 12))
                .foregroundColor(Color(hex: "#F52D2D"))
            Spacer()
        }
    }
}

#Preview {
    DiscordOTPView()
}
