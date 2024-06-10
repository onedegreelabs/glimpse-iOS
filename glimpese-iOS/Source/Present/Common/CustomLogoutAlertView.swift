//
//  CustomLogoutAlertView.swift
//  glimpese-iOS
//
//  Created by KIM Hyung Jun on 1/24/24.
//

import SwiftUI

struct CustomLogoutAlertView: View {
    @Binding var isPresented: Bool
    @State private var isVisible = false
    @State var isLogouted: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(isVisible ? 0.4 : 0).edgesIgnoringSafeArea(.all)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isVisible = false
                    isPresented = false
                }
            
            if isPresented {
                VStack(spacing: 20) {
                    HStack {
                        Text("Log Out")
                            .font(.pretendard(.semibold, size: 24))
                        
                        Spacer()
                        
                        Button(action: {
                            isPresented = false
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .fontWidth(.compressed)
                        }
                    }
                    .padding()
                    
                    HStack {
                        Text("Do you want to log out?")
                            .font(.pretendard(.regular, size: 16))
                            .padding(.leading, 18)
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 7) {
                        Button("close") {
                            isPresented = false
                        }
                        .frame(width: 130, height: 25)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(4)
                        .fontWeight(.semibold)
                        
                        // MARK: To DO: Logout api 호출, 화면이동
                        Button("confirm") {
                            isLogouted.toggle()
                        }
                        .frame(width: 130, height: 25)
                        .padding()
                        .background(Color(hex: "7e51fd"))
                        .foregroundColor(.white)
                        .cornerRadius(4)
                        .fontWeight(.semibold)
                    }
                    .padding()
                    .fullScreenCover(isPresented: $isLogouted) {
                        ContentView(selectedTab: .first)
                        .transaction { transaction in
                            transaction.disablesAnimations = true
                        }
                    }
                }
                .frame(width: 360, height: 220)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .scaleEffect(isVisible ? 1 : 0.5)
                .opacity(isVisible ? 1 : 0)
                .onAppear {
                    withAnimation {
                        isVisible = true
                    }
                }
            }
        }
    }
}

