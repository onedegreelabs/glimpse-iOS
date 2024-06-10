//
//  HeaderView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/23/24.
//

import SwiftUI
import ComposableArchitecture

struct HeaderView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var isPresented: Bool = false
    @Perception.Bindable var store: StoreOf<LoginInputFeature>

    var body: some View {
        WithPerceptionTracking {
            VStack {
                HStack {
                    Button{
                        isPresented.toggle()
                    }
                label: {
                    Image("sign left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .fullScreenCover(isPresented: $isPresented) {
                    LoginView()
                }
                .offset(x: -80)
                    Text("Enter Code")
                        .multilineTextAlignment(.center)
                        .font(.pretendard(.regular, size: 24))
                        .offset(x: -20)
                }
                
                Spacer().frame(height: 16)
                
                VStack {
                    Text("Please enter the six-digit code sent to")
                        .padding(.top, 5)
                        .font(.pretendard(.regular, size: 14))
                        .multilineTextAlignment(.center)
                    
                    Text(store.emailAddress)
                        .multilineTextAlignment(.center)
                        .tint(.black)
                        .font(.pretendard(.semibold, size: 14))
                }
            }
        }
    }
}

