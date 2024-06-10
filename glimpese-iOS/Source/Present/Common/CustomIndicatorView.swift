//
//  CustomIndicatorView.swift
//  glimpese-iOS
//
//  Created by KIM Hyung Jun on 1/26/24.
//

import SwiftUI

struct CustomIndicatorView: View {
    @State private var rotation: Double = 0

    var body: some View {
        Canvas { context, size in
            let lineWidth: CGFloat = 3
            let radius = (size.width - lineWidth) / 2

            let backgroundCircle = Path { path in
                path.addArc(center: CGPoint(x: size.width / 2, y: size.height / 2),
                            radius: radius,
                            startAngle: .degrees(0),
                            endAngle: .degrees(360),
                            clockwise: false)
            }
            context.stroke(backgroundCircle, with: .color(Color.gray.opacity(0.3)), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))

            let loadingIndicator = Path { path in
                path.addArc(center: CGPoint(x: size.width / 2, y: size.height / 2),
                            radius: radius,
                            startAngle: .degrees(rotation),
                            endAngle: .degrees(rotation + 90),
                            clockwise: false)
            }
            context.stroke(loadingIndicator, with: .color(Color(hex: "545454")), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
        }
        .frame(width: 18, height: 18)
        .rotationEffect(.degrees(rotation))
        .onAppear {
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                rotation = 360
            }
        }
    }
}

struct CustomIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        CustomIndicatorView()
    }
}
