import SwiftUI
import ComposableArchitecture

struct EventDetailView: View {
    
    //    let store: StoreOf<EventDetailFeature>
    //    @State private var selectedTab: Tab = .first
    //    @State private var isSideMenuPresented = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        //        WithPerceptionTracking {
        HStack(spacing: 8) {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image("Caret left")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            Text("Event Detail")
                .font(.pretendard(.medium, size: 20))
                .foregroundColor(Color(hex: "#171717"))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 8)

        ScrollView {
            VStack(alignment: .leading) { 
                EventHeaderView()
                    .padding(.top, -50)
                Spacer().frame(height: 20)
                EventMainInfoView()
                    .padding()
                EventSubInfoView()
                    .padding()
                
                //                   89 if let childStore = self.store.scope(state: \.eventInfoFeature, action: \.eventInfoFeature) {
                //                        EventInfoView(store: childStore, eventDetail: store.eventDetailData.first!)
                //                            .padding(.top, 20)
                //                    }
                //                    else {
                //                        Text("Nothing to show")
                //                    }
                //
                //                    FilterView()
                //                        .padding(20)
                //                LazyVGrid(columns:  [GridItem()], spacing: 10) {
                //                    ForEach(store.participantData, id: \.id) { member in
                //                            ParticipantView()
                //                        }
                //                }           
            }
        }
        RSVPButtonView()
            .edgesIgnoringSafeArea(.bottom)
    }
    //        .onAppear {
    //            store.send(.getEventDetail)
    //        }
    //    }
}

#Preview {
    EventDetailView()
}
