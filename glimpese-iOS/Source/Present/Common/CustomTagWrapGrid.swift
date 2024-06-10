//
//  CustomTagWrapGrid.swift
//  glimpese-iOS
//
//  Created by KIM Hyung Jun on 1/14/24.
//

import SwiftUI
import Combine

struct CustomTagWrapGrid: View {
    @EnvironmentObject var viewModel: EventCreationViewModel
    var tags: [String]
    let itemSpacing: CGFloat = 3
    let lineSpacing: CGFloat = 3
    let horizontalPadding: CGFloat = 5
    
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
                .background(GeometryReader { proxy in
                    Color.clear.preference(key: TagGridHeightPreferenceKey.self, value: proxy.size.height)
                })
        }
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                self.item(for: tag)
                    .padding([.horizontal], self.horizontalPadding / 2)
                    .alignmentGuide(.leading) { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= d.height + self.lineSpacing
                        }
                        let result = width
                        if tag == self.tags.last {
                            width = 0 // last item
                        } else {
                            width -= d.width + self.itemSpacing
                        }
                        return result
                    }
                    .alignmentGuide(.top) { d in
                        let result = height
                        if tag == self.tags.last {
                            height = 0 // last item
                        }
                        return result
                    }
            }
        }
    }
    
    func item(for text: String) -> some View {
        HStack(spacing: 3) {
            Text(text)
                .font(.system(size: 12))
            Image(systemName: "xmark")
                .imageScale(.medium)
                .foregroundColor(.black)
                .font(.system(size: 12))
                .onTapGesture {
                    viewModel.removeTag(text)
                }
        }
        .padding(.all, 8)
        .font(.body)
        .foregroundColor(.black)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
        
    }
}

struct TagGridHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
