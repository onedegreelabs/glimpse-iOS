//
//  GlimpseIcon.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/21/24.
//

import SwiftUI

struct IconView: View {
    var body: some View {
        Text("Glimpse")
            .font(.pretendard(.regular, size: 12))
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(8)
            .frame(width: 113, height: 56, alignment: .center)
            .background(Color(hex: "#7E51FD"))
            .cornerRadius(28)
    }
}


