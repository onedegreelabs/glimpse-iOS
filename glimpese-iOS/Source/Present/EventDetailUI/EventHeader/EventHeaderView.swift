//
//  EventHeaderView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 4/9/24.
//

import SwiftUI
import ComposableArchitecture
import Kingfisher

struct EventHeaderView: View {
//    let eventDetail: EventDetailData
//    let store: StoreOf<EventDetailFeature>
    var body: some View {
            ZStack {
                VStack {
                    Spacer().frame(height: 160)
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white.opacity(0.8))
                        .frame(width: 250,height: 50)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                        .overlay(
                            HStack {
                                Image(systemName: "person.3.sequence.fill")
                                    .foregroundColor(.blue)
                                
                                Text("+ 5 Going")
                                    .font(.pretendard(.medium, size: 16))
                                
                                Spacer().frame(width: 50)
                                
                                Button{
                                    
                                } label: {
                                    Text("invite")
                                        .font(.pretendard(.medium, size: 14))
                                        .foregroundColor(.white)
                                }.background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.blue)
                                        .frame(width: 50, height: 30)
                                )
                            }
                        )
                }
            }
            .background(backgroundView)
            .frame(maxWidth: .infinity)
    }
    
    private var backgroundView: some View {
//               if let imageURLString = eventDetail.coverImage, let imageURL = URL(string: imageURLString) {
//                   KFImage(imageURL)
//                       .resizable()
//                       .scaledToFill()
//               } else {
//                   LinearGradient(
//                    gradient: Gradient(colors: [Color(hex: "#7FC9FF"), Color(hex: "#9647FF")]),
//                                  startPoint: .topLeading,
//                                  endPoint: .bottomTrailing
//                   )
        Image("example img")
            .resizable()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.2)
//               }
       }
}

#Preview {
    EventHeaderView()
}
