//
//  LabelTextField.swift
//  glimpese-iOS
//
//  Created by KIM Hyung Jun on 2/3/24.
//

import SwiftUI

struct LabelTextField: View {
    var label: String
    var placeholder: String
    var imageName: String?
    var imagePaddingTop: CGFloat = 0
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(label)
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                    .padding(.top, 30)
                
                if let imageName = imageName {
                    Image(systemName: imageName)
                        .imageScale(.medium)
                        .padding(.top, imagePaddingTop)
                        .foregroundColor(Color(hex: "8b8b8b"))
                }
            }
            
            TextField(placeholder, text: $text)
                .font(.system(size: 14))
                .foregroundColor(.black)
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(hex: "d6d6d6"), lineWidth: 1.5)
                )
                .padding([.trailing], 15)
        }
    }
}
