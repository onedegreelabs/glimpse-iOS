//
//  ChoiceFilterView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 2024/01/10.
//

import SwiftUI

struct ChoiceFilterView: View {
    enum Section: String, CaseIterable {
        case participant = "Participant"
        case industry = "Industry"
        case location = "Location"
        case hobby = "Hobby"
        case favorite = "Favorite"
        case interest = "Interest"
    }
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedSection: Section? = nil
    @State private var selectedFilter: String? = nil
    @State private var showPlusFilter: Bool = false
    @State private var finishTapped: Bool = false
    @State private var selectedButtonText: String = ""
    @State private var selectedDetails: [String] = ["All"]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(FilterData.FilterTexts, id: \.self) { buttonText in
                        FilterButton(text: buttonText, isSelected: buttonText == selectedFilter) {
                            selectedSection = Section(rawValue: buttonText)
                            selectedFilter = buttonText
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top, 30)
            Spacer()
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach(sectionTexts(), id: \.self) { buttonText in
                        FilterDetailButton(text: buttonText) { selectedText in
                            
                            selectedButtonText = selectedText
                            
                            if !selectedDetails.contains(selectedText) {
                                selectedDetails.append(selectedText)
                                print("Button '\(selectedText)' pressed.")
                            }
                            
                            selectedButtonText = ""
                        }
                    }
                }
            }
            .padding()
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem()]) {
                        ForEach(selectedDetails, id: \.self) { buttonText in
                            HStack {
                                Text(buttonText)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14.0))
                                    .fixedSize()
                                    .layoutPriority(1)
                                
                                Spacer()
                                
                                Button {
                                    if let index = selectedDetails.firstIndex(of: buttonText) {
                                        selectedDetails.remove(at: index)
                                    }
                                } label: {
                                    Image("Cross")
                                        .resizable()
                                        .foregroundColor(.black)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24, height: 24)
                                }
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color(hex: "#F3F3F3"))
                            )
                        }
                    }.padding(.leading, 10)
                }
                
                HStack {
                    Button {
                        selectedDetails.removeAll()
                    } label: {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.white)
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                            .overlay(
                                Text("reset")
                                    .foregroundColor(.black)
                                    .cornerRadius(4)
                            )
                    }.frame(width: 72, height: 44)
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color(hex: "#7E51FD"))
                            .overlay(
                                Text("finish")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            )
                    }.frame(width: 250, height: 45)
                    
                }
                .padding()
            }
        }
    }
    
    func FilterButton(text: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: 16.0))
                .foregroundColor(.black)
                .fontWeight(isSelected ? .bold : .regular)
        }
        .padding(.horizontal, 5)
        .padding(.vertical, 4)
    }
    
    func FilterDetailButton(text: String, action: @escaping (String) -> Void) -> some View {
        Button(action: {
            action(text)
        }){
            VStack{
                HStack{
                    Text(text)
                        .foregroundColor(.black)
                        .font(.system(size: 13.0))
                        .fixedSize()
                    Spacer()
                }
                Rectangle()
                    .foregroundColor(.clear)
                    .background(Color(hex: "#F3F3F3"))
                    .frame(width:156, height: 2)
                    .padding(5)
                    
            }
            
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
        }
    }
    
    func sectionTexts() -> [String] {
        switch selectedSection {
        case .participant:
            return FilterData.participantTexts
        case .industry:
            return FilterData.industryTexts
        case .location:
            return FilterData.locationTexts
        case .hobby:
            return FilterData.hobbyTexts
        case .favorite:
            return FilterData.favoriteTexts
        case .interest:
            return FilterData.interestTexts
        default:
            return []
        }
    }
}

#Preview {
    ChoiceFilterView()
}
