//
//  TextOTPView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/23/24.
//

import SwiftUI
import ComposableArchitecture

struct TextOtpView: View {
    
    @Perception.Bindable var store: StoreOf<TextOtpFeature>
    @FocusState private var isKeyBoardShowing: Bool
 
    var body: some View {
        WithPerceptionTracking {
            VStack {
                HStack(spacing: 10) {
                    ForEach(0..<6, id: \.self) { index in
                        OTPTextBox(index)
                    }
                }
                .background(content: {
                    TextField("", text: $store.otpText.sending(\.otpTextChanged))
                        .textContentType(.oneTimeCode)
                        .frame(width: 1, height: 1)
                        .opacity(0.001)
                        .blendMode(.screen)
                        .focused($isKeyBoardShowing)
                        .onSubmit {
                            otpChanged(store.otpText)
                        }
                })
                .fullScreenCover(isPresented: $store.isPresented) {
                    ContentView(selectedTab: .first)
                        .transaction { transaction in
                            transaction.disablesAnimations = true
                        }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    isKeyBoardShowing.toggle()
                    store.send(.onTapGesture)
                }
            }
        }
    }
    // MARK: OPT Text Box
    @ViewBuilder
    func OTPTextBox(_ index: Int)->some View {
        ZStack{
            if store.otpText.count > index {
                let startIndex = store.otpText.startIndex
                let charIndex = store.otpText.index(startIndex, offsetBy: index)
                let charToString = String(store.otpText[charIndex])
                Text(charToString)
            } else {
                Text(" ")
            }
        }
        .frame(width: 40, height: 40)
        
        .background {
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .inset(by: 0.5)
                .stroke(Color(hex: "#D9D9D9"), lineWidth: 1)
        }
    }
    
    func otpChanged(_ text: String) {
        if text.count == 6 {
            store.send(.requestSever(text))
            store.send(.enterClicked)
        }
    }
}

// MARK: Binding <String> Extension
extension Binding where Value == String {
    func limit(_ length: Int)-> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}
