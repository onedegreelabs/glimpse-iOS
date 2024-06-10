import SwiftUI
import ComposableArchitecture
import Kingfisher

struct CustomWrapperModifier02: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 4.5, x: 0, y: 0)
    }
}

struct EventItemView: View {
    let eventData: EventData
    
    var body: some View {
        WithPerceptionTracking {
            HStack {
                HStack {
                        if let imageURLString = eventData.coverImage,
                           let imageURL = URL(string: imageURLString) {
                            KFImage(imageURL)
                                .resizable()
                                .frame(width: 78, height: 78)
                                .cornerRadius(10)
                        } else {
                            Image("DefaultEvent")
                                .resizable()
                                .frame(width: 78, height: 78)
                                .cornerRadius(10)
                        }
                    
                    VStack(alignment: .leading) {
                        Text(eventData.title)
                            .font(.pretendard(.semibold, size: 16))
                        HStack {
                            Image("Clock")
                                .frame(width: 16, height: 16)
                            Text(formatTime(inputDate: eventData.startAt))
                                .font(.pretendard(.regular, size: 12))
                            if eventData.type == "Offline" {
                                Image("Location")
                                    .frame(width: 16, height: 16)
                                Text("\(eventData.region!.twoDepth)  \(eventData.region!.threeDepth)")
                                    .font(.pretendard(.regular, size: 12))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                        HStack {
                            if let imageURLString = eventData.coverImage,
                               let imageURL = URL(string: imageURLString) {
                                KFImage(imageURL)
                                    .frame(width: 14, height: 14)
                                    .cornerRadius(10)
                            } else {
                                Image("DefaultEvent")
                                    .frame(width: 14, height: 14)
                                    .cornerRadius(10)
                            }
                            Text("By \(eventData.organizer.givenName ?? "")")
                                .font(.pretendard(.regular, size: 12))
                        }
                    }
                }
                Spacer()
            }.modifier(CustomWrapperModifier(width: 315, height: 110))
        }
    }
}


