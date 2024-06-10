//
//  ErrorAlertVIew.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/21/24.
//

import SwiftUI

struct ErrorAlertView: View {
    var body: some View {
        HStack {
            Image("Warning")
            Text("email is not vaild.")
                .font(.pretendard(.regular, size: 12))
                .foregroundColor(Color(hex: "#F52D2D"))
            Spacer()
        }
    }
}
