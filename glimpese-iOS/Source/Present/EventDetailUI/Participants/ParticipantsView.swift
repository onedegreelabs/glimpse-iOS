//
//  ParticipantView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 2024/01/16.
//

import SwiftUI

struct ParticipantsView: View {
    @State private var searchText: String = ""
    @State private var chatButtonTapped: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    let participants: MemberDto = {
        let member1 = MemberData(name: "철수", specialization: "개발자", tags: ["Swift", "독서"])
        let member2 = MemberData(name: "영희", specialization: "디자이너", tags: ["UI/UX", "그림", "영화 감상"])
        let member3 = MemberData(name: "민수", specialization: "매니저", tags: ["팀워크", "리더십", "여행", "축구"])
        let member4 = MemberData(name: "지수", specialization: "테스터", tags: ["버그 찾기", "게임", "코딩"])
        let member5 = MemberData(name: "호영", specialization: "엔지니어", tags: ["백엔드", "캠핑", "자전거", "요리", "등산"])
        let member6 = MemberData(name: "수민", specialization: "분석가", tags: ["데이터 분석", "러닝", "책 읽기", "배드민턴"])
        return MemberDto(member: [member1, member2, member3, member4, member5, member6])
    }()
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    
    var body: some View {
        HStack(spacing: 8) {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image("Caret left")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            Text("Participants")
                .font(.pretendard(.medium, size: 20))
                .foregroundColor(Color(hex: "#171717"))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 8)
        
        VStack {
            SearchBar()
                .padding()
        }
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(participants.member, id: \.name) { member in
                    ParticipantDetailView(member: member)
                }
            }
            .padding()
        }
    }
}

struct SearchBar: View {
    @State private var searchText: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search", text: $searchText)
                .padding(.vertical, 10)
                .padding(.horizontal, 5)
                .frame(width: 280, height: 30)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(.white)
        .cornerRadius(20)
        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 2)
    }
}


struct CustomWrapperModifier: ViewModifier {
    let width: CGFloat
    let height: CGFloat
    func body(content: Content) -> some View {
        content
            .padding(20)
            .frame(width: width, height: height)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 4.5, x: 0, y: 0)
    }
}

#Preview {
    ParticipantsView()
}
