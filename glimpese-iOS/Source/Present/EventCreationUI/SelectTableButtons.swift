//
//  SelectTableButtons.swift
//  glimpese-iOS
//
//  Created by KIM Hyung Jun on 2/3/24.
//

import SwiftUI

struct SelectTableButtons: View {
    var label: String
    var options: [String]
    @Binding var selectedOption: String
    
    var body: some View {
        Text(label)
            .foregroundColor(.black)
            .fontWeight(.medium)
            .padding(.top, 25)
        
        HStack(spacing: 50) {
            ForEach(options, id: \.self) { option in
                CustomRadioButton(
                    id: option,
                    label: option,
                    isMarked: Binding(
                        get: { selectedOption == option },
                        set: { isSelected in
                            if isSelected { selectedOption = option }
                        }
                    ),
                    action: { selectedType in
                        selectedOption = selectedType
                    }
                )
            }
        }
    }
}
