//
//  CustomRoundRectangle.swift
//  glimpese-iOS
//
//  Created by 서원진 on 5/14/24.
//

import SwiftUI

struct CustomRoundRectangle: View  {
    var width: CGFloat
    var height: CGFloat
    var hexCode: String
    var cornerRadius: CGFloat
    var text: String
    var fontSize: CGFloat
    var fontColor: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(Color(hex: hexCode))
            .frame(width: width, height: height)
            .overlay(
                Text(text)
                    .font(.pretendard(.medium, size: fontSize))
                    .foregroundStyle(Color(hex: fontColor))
            )
    }
}
