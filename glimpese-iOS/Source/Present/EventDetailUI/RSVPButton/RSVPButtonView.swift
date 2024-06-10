//
//  RSVPView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 5/16/24.
//

import SwiftUI

struct RSVPButtonView: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Rectangle()
//                    .fill(Color(hex: "#7E51FD"))
                    .fill(Color.white.opacity(0.8))
                    .overlay {
                        HStack(spacing: 8){
                            Image(systemName: "person.fill.badge.plus")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.blue)
                            
                            Text("Join")
                                .foregroundColor(.blue)
                                .font(.pretendard(.medium, size: 20))
                        }
                    }
                    .cornerRadius(20)
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.07)
                
            }
        }
        .background(.clear)
    }
}

#Preview {
    RSVPButtonView()
}
