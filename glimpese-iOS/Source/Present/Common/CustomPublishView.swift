//
//  CustomPublishView.swift
//  glimpese-iOS
//
//  Created by KIM Hyung Jun on 1/25/24.
//

import SwiftUI

struct CustomPublishView: View {
    @Binding var isPresented: Bool
    @State private var isVisible = false
    
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
                        Text("Publish & Share")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                        
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
                    
                    VStack {
                        Text("Congratulations!")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            
                        Text("Event Published Successfully")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                        
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        Button(action: {
                            isPresented = false
                        }) {
                            Image("Link")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 23, height: 23)
                            
                            Text("Copy Share Link")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                        .frame(width: 270, height: 50)
                        .background(Color(hex: "7E51FD"))
                        .cornerRadius(5)
                    }
                }
                .frame(width: 360, height: 240)
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
