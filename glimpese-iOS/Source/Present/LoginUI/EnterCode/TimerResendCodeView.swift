//
//  TimerResendCodeView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 3/25/24.
//

import SwiftUI
import ComposableArchitecture

struct TimerResendCodeView: View {
    let store: StoreOf<ResendAlertFeature>
    @State private var remainingMinute = 2
    @State private var remainingSecond = 59
    @State private var remainingTime = 1
    @State private var alertState = false
    @State var isResend = false
    @State var timeState = false
    @State var resendButtonPressedAt: Date?
    var timer: Timer?
    var body: some View {
        
        HStack {
            Text(timeState ? "Time out" : "Remaining time \(remainingMinute > 0 ? "\(remainingMinute)min" : "") \(remainingSecond)sec")
                .foregroundColor(timeState ? .red : .black)
                .font(.pretendard(.regular, size: 12))
            
            Spacer()
            Button {
                resendButtonPressed()
            } label: {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color(hex: "#F3F3F3"))
                    .overlay(
                        Text("resend code")
                            .foregroundColor(.black)
                            .font(.pretendard(.regular, size: 12))
                    )
            }.frame(width: 91, height: 28)
        }
        .onAppear {
            startTimer()
        }
    }
    
    func startTimer() {
        
        remainingMinute = 2
        remainingSecond = 59
        
        Timer.scheduledTimer(withTimeInterval: TimeInterval(1), repeats: true) { timer in
            if remainingSecond > 0 {
                remainingSecond -= 1
            } else {
                if remainingMinute > 0 {
                    remainingMinute -= 1
                    remainingSecond = 59
                } else {
                    timer.invalidate()
                    timeState = true
                }
            }
        }
    }
    func resendButtonPressed() {
        if resendButtonPressedAt == nil {
            resendButtonPressedAt = Date()
        } else {
            if let resendTime = resendButtonPressedAt, Date().timeIntervalSince(resendTime) <= 60 {
                store.send(.trueState)
                return
            }
            resendButtonPressedAt = Date()
        }
        // resend sendmail 
        store.send(.falseState)
        timeState = false
        timer?.invalidate()
        startTimer()
    }
}

