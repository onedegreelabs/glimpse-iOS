//
//  EventInfoView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 2024/01/25.
//
import SwiftUI
import ComposableArchitecture

struct EventMainInfoView: View {
    
    @State var isPresented: Bool = false
    //    let store: StoreOf<EventInfoFeature>
    //
    //    let eventDetail: EventDetailData
 
    
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    CustomRoundRectangle(
                        width: 50, height: 20,
                        hexCode: "#7E51FD", cornerRadius: 5, text: "Offline",fontSize: 15, fontColor: "FFFFFFF"
                    )
                    CustomRoundRectangle(
                        width: 50, height: 20,
                        hexCode: "#7E51FD", cornerRadius: 5, text: "Game",fontSize: 15, fontColor: "FFFFFFF"
                    )
                }
                Text("2024 Leage of Legend Party")
                    .font(.pretendard(.medium, size: 20))
                
                Text("리그오브레전드를 사랑하는 모임")
                    .font(.pretendard(.regular, size: 14))
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Button {
                   
                } label: {
                    HStack(spacing: 15) {
                        Image("Date")
                        VStack(alignment: .leading, spacing: 10) {
                            Text("2024년 7월 18일")
                                .font(.pretendard(.medium, size: 16))
                                .foregroundColor(.black)
                            Text("화요일, 4:00PM ~ 9:00PM")
                                .font(.pretendard(.medium, size: 12))
                                .foregroundStyle(Color(hex: "#747688"))
                        }
                    }
                    Spacer()
                    Image("Arrow Right")
                }
                Button {
                   
                } label: {
                    HStack(spacing: 15) {
                        Image("Location 1")
                        VStack(alignment: .leading, spacing: 10) {
                            Text("티원 베이스캠프")
                                .font(.pretendard(.medium, size: 16))
                                .foregroundColor(.black)
                            Text("마포구 양화로 147 지하1층")
                                .font(.pretendard(.medium, size: 12))
                                .foregroundStyle(Color(hex: "#747688"))
                        }
                    }
                    Spacer()
                    Image("Arrow Right")
                }
                
                Button {
                    isPresented.toggle()
                } label: {
                    HStack(spacing: 15) {
                        Image("Participants")
                        VStack(alignment: .leading, spacing: 10) {
                            Text("누가 오나요?")
                                .font(.pretendard(.medium, size: 16))
                                .foregroundColor(.black)
                            Text("5명 빠르게 살펴보기")
                                .font(.pretendard(.medium, size: 12))
                                .foregroundStyle(Color(hex: "#747688"))
                        }
                    }
                    Spacer()
                    Image("Arrow Right")
                }
                .fullScreenCover(isPresented: $isPresented) {
                    ParticipantsView()
                }
                .transaction { transaction in
                    transaction.disablesAnimations = true
                } 
            }
        }
    }
    
    //    var skipText: String {
    //        let eventDirection = eventDetail.description
    //        guard eventDirection.count > 100 else {
    //            return eventDirection
    //        }
    //        return String(eventDirection.prefix(100)) + "..."
    //    }
    //
    //    var body: some View {
    //        // MARK: To Do Online / Offline 조건 맞춰서 UI
    //        HStack {
    //            Spacer().frame(width: 20)
    //            VStack(alignment: .leading) {
    //                if eventDetail.type == "Offline" {
    //                    HStack {
    //                        Image("Calendar")
    //                            .frame(width: 16, height: 16)
    //                        Text(formatTime(inputDate: eventDetail.startAt))
    //                    }
    //                    HStack {
    //                        Image("Clock")
    //                            .frame(width: 20, height: 16)
    //                        Text(formatTime(inputDate: eventDetail.startAt))
    //                    }
    //                    HStack {
    //                        Image("Location")
    //                            .frame(width: 16, height: 16)
    //                        Text("\(eventDetail.region!.twoDepth)  \(eventDetail.region!.threeDepth)")
    //                    }
    //                } else {
    //                    HStack {
    //                        Image("Calendar")
    //                            .frame(width: 16, height: 16)
    //                        Text(formatTime(inputDate: eventDetail.startAt))
    //                    }
    //                    HStack {
    //                        Image("Clock")
    //                            .frame(width: 20, height: 16)
    //                        Text(formatTime(inputDate: eventDetail.startAt))
    //                    }
    //                    // MARK: 링크 UI
    //
    //                }
    //                Text(store.isExpanded ? eventDetail.description : skipText)
    //                    .lineLimit(store.isExpanded ? nil : 3)
    //                    .fixedSize(horizontal: false, vertical: true)
    //                    .font(.system(size: 16.0))
    //            }
    //        }
    //
    //        if eventDetail.description.count > 100 {
    //            Button(action: {
    //                store.send(.moreClicked)
    //            }) {
    //                HStack {
    //                    Image("Caret down")
    //                    if !store.isExpanded {
    //                        Text("More")
    //                            .foregroundColor(.black)
    //                    } else {
    //                        Text("Less")
    //                            .foregroundColor(.black)
    //                    }
    //                }
    //            }
    //        }
    //
    //        Rectangle()
    //            .foregroundColor(.clear)
    //            .frame(maxWidth: .infinity, minHeight: 10, maxHeight: 10)
    //            .background(Color(hex: "#F3F3F3"))
    //    }
    //}
}

#Preview {
    EventMainInfoView()
}
