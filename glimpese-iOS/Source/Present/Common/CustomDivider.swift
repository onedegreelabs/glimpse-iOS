//
//  CustomDivider.swift
//  glimpese-iOS
//
//  Created by 서원진 on 4/23/24.
//
import SwiftUI

struct customDivider: View  {
    @State var height = 0.0
    
    var body: some View {
        Divider()
            .frame(height: height)
            .background(Color(hex: "e7e7e7"))
            .padding([.top, .leading, .trailing])
            .padding(.top, 15)
    }
    
}
