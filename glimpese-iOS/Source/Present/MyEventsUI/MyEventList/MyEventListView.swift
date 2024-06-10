//
//  GroupDateView.swift
//  glimpese-iOS
//
//  Created by 서원진 on 4/3/24.
//

import SwiftUI
import ComposableArchitecture

struct MyEventListView: View {
    var store: StoreOf<MyEventsFeature>

    var body: some View {
        WithPerceptionTracking {
            let groupedEvents = groupEventsByDate(events: store.eventData)
            VStack {
                ForEach(Array(groupedEvents.keys.sorted().reversed()), id: \.self) { dateKey in
                    HStack {
                        Text(dateKey)
                            .padding(.leading, 20)
                            .padding(.top, 20)
                            .font(.pretendard(.semibold, size: 16))
                        Spacer()
                    }
                    Spacer().frame(height: 15)
                    VStack(alignment: .leading) {
                        
                        ForEach(groupedEvents[dateKey] ?? [], id: \.id) { eventData in
                            EventItemView(eventData: eventData)
                            Spacer().frame(height: 20)
                        }
                     
                    }
                    Spacer().frame(height: 25)
                    
                    if dateKey != groupedEvents.keys.sorted().reversed().last {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(maxWidth: .infinity, minHeight: 10, maxHeight: 10)
                            .background(Color(hex: "#F3F3F3"))
                    }
                }
            }
        }.onAppear {
            store.send(.onAppear)
        }
    }
}

func groupEventsByDate(events: [EventData]) -> [String: [EventData]] {
    return Dictionary(grouping: events, by: { formatDate(inputDate: $0.startAt) })
}
