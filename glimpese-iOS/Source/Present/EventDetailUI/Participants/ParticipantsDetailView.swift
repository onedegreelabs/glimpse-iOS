//
//  ParticipantsDetailView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 5/21/24.
//

import SwiftUI

struct ParticipantDetailView: View {
    let member: MemberData
    var body: some View {
            VStack(alignment: .leading) {
                HStack(spacing: 15) {
                    VStack {
                        Image("example img")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    }
                    VStack(alignment: .leading, spacing: 15) {
                        Text(member.specialization)
                            .font(.pretendard(.medium, size: 13))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .fixedSize()
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(Color(hex: "#8FBC8F"))
                            )
                        Text(member.name)
                            .font(.pretendard(.medium, size: 18))
                        Text("AAA@gmail.com")
                            .font(.pretendard(.medium, size: 12))
                            .tint(.black)
                        TagBackgroundView(tags: member.tags)
                    }
                    Spacer()
                }
            }
            .modifier(
                CustomWrapperModifier(
                    width: UIScreen.main.bounds.width * 0.9,
                    height: UIScreen.main.bounds.height * 0.2
                ))
    }
}

struct TagBackgroundView: View {
    let tags: [String]
    
    init(tags: [String]) {
        if tags.count < 3 {
            self.tags = tags + Array(repeating: "", count: 3 - tags.count)
        } else {
            self.tags = Array(tags.prefix(3))
        }
    }
    
    var body: some View {
        HStack {
            ForEach(tags, id: \.self) { tag in
                Text(tag.isEmpty ? "" : "#" + tag)
                    .font(.pretendard(.medium, size: 12))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .fixedSize()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(hex: "#DCDCDC"))
                    )
                    .opacity(tag.isEmpty ? 0 : 1)
            }
        }
    }
}
