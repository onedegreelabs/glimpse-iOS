//
//  EventSubInfoView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 5/16/24.
//

import SwiftUI

struct EventSubInfoView: View {
    
    @State var isExpanded: Bool = false
    
    let eventDescription = "티원 베이스캠프에서 리그 오브 레전드 게임을 즐기는 파티는 즐거운 게임 경험을 공유하고 함께 소통하는 모임입니다. 멤버들끼리 모여서 실력 향상을 위한 연습전을 하거나 함께 소환사의 협곡을 탐험하는 등 다양한 활동을 즐깁니다. 캠프 내에서는 게임 뿐만 아니라 다른 취미나 관심사에 대해 이야기를 나누고 새로운 친구들과 친목을 도모하는 행사도 자주 열립니다. 함께 즐거운 시간을 보내며 게임에 대한 열정을 공유하는 이 특별한 파티에 여러분도 참여해보세요!"
    
    var skipText: String {
        guard eventDescription.count > 130 else {
            return eventDescription
        }
        return String(eventDescription.prefix(130)) + "..."
    }
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            Text("About Event")
                .font(.pretendard(.medium, size: 18))
            
            Spacer().frame(height: 5)
            
            Text(isExpanded ? eventDescription: skipText)
                .lineLimit(isExpanded ? nil : 3)
                .font(.pretendard(.regular, size: 14))
                .lineSpacing(10)
            if eventDescription.count > 130 {
                Button(action: {
                    isExpanded.toggle()
                }) {
                    HStack {
                        Image("Caret down")
                            .resizable()
                            .frame(width: 30, height: 30)
                        if !isExpanded {
                            Text("Read More")
                                .foregroundColor(.black)
                        } else {
                            Text("Less")
                                .foregroundColor(.black)
                        }
                    }
                    .fixedSize(horizontal: true, vertical: false)
                    .padding(.top, 10)
                }
                .padding(.top, 5)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        
        VStack(alignment: .leading, spacing: 15) {
            Text("About Host")
                .font(.pretendard(.medium, size: 18))
            HStack(spacing: 20) {
                Image("DefaultEvent")
                    .resizable()
                    .frame(width: 76, height: 76)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 5) {
                    Text("Wonin Seo")
                        .font(.pretendard(.regular, size: 16))
                    Text("abc1234@gmail.com")
                        .font(.pretendard(.regular, size: 14))
                }
            }
        }
    }
}
