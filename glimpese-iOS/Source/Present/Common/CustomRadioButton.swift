//
//  CustomRadioButton.swift
//  glimpese-iOS
//
//  Created by KIM Hyung Jun on 1/12/24.
//

import SwiftUI

struct CustomRadioButton: View {
    let id: String
    let label: String
    @Binding var isMarked: Bool
    let action: (String) -> Void
    
    var body: some View {
        Button(action: { self.action(self.id) }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "record.circle" : "circle")
                    .foregroundColor(self.isMarked ? .black : Color(hex: "d6d6d6"))
                Text(label)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
            }
        }
    }
}


