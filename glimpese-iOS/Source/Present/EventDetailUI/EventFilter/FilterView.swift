//
//  FilterView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 2024/01/07.
//

import SwiftUI

class ShowType: ObservableObject {
    @Published var showType: Int = 0
}

struct FilterView: View {
       
    @State private var searchText: String = ""
    @State private var showSheet = false
    
    let buttons: [(String, String)] = [
            ("all", "Gray Caret down"),
            ("Participant", "Gray Caret down"),
            ("Industry", "Gray Caret down"),
            ("Location", "Gray Caret down"),
            ("Hobby", "Gray Caret down"),
            ("Favorite", "Gray Caret down"),
            ("Interest", "Gray Caret down")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Participant List")
                .font(.system(size: 18))
            
            HStack {
                HStack {
                    ImagePlaceholderTextField(text: $searchText)
                        .frame(height: 36)
                }
                
        
                
            }
            
            HStack {
                Spacer().frame(width: 5)
                Rectangle()
                    .foregroundColor(.clear)
                    .background(Color(hex: "#F3F3F3"))
                    .frame(height: 3)
                Spacer()
            }.padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(buttons, id: \.0) { buttonText, imageName in
                        customButton(text: buttonText, imageName: imageName) {
                            showSheet.toggle()
                        }
                    }
                }
                .padding(.top)
            }

            .sheet(isPresented: $showSheet) {
                ChoiceFilterView()
                    .presentationDetents([.height(400), .medium, .large])
            }
            
        }
        
    }
    
    func customButton(text: String, imageName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .foregroundColor(.black)
                    .font(.system(size: 12.0))
                    .fixedSize()
                    .layoutPriority(1)
                
                Spacer()
                
                Image(imageName)
                    .resizable()
                    .foregroundColor(.black)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color(hex: "#DEDEDE"), lineWidth: 1.5)
            )
        }
    }

}

extension View {
    func transparentFullScreenCover<Content: View>(isPresented: Binding<Bool>, content: @escaping () -> Content) -> some View {
        fullScreenCover(isPresented: isPresented) {
            ZStack {
                content()
            }
            .background(TransparentBackground())
        }
    }
}

struct TransparentBackground: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct ImagePlaceholderTextField: View {
    @Binding var text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .stroke(Color(hex: "#D9D9D9"), lineWidth: 1)
            .frame(width: 180, height: 32)
            .overlay(
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                    }
                    
                    TextField("       search...", text: $text)
                        .padding(.horizontal, 5)
                }
            )
    }
}
