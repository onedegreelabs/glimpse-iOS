import SwiftUI
import ComposableArchitecture

struct EmptyEventView: View {
    @Perception.Bindable var store: StoreOf<EventFloatingFeature>
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Image("Profile card")
                Spacer().frame(height: 16)
                Text("There are no events to discover.")
                    .font(.pretendard(.regular,size: 20))
                Text("Would you like to create one?")
                    .font(.pretendard(.regular,size: 16))
                    .foregroundColor(Color(hex: "#A8A8A8"))
                Spacer().frame(height: 32)
                Button{
                    store.send(.floatingClicked)
                } label: {
                    Image("Create Event")
                }
            }
//                .fullScreenCover(isPresented: $store.isFloatingClicked) {
//                EventCreationView(
//                    store: Store(initialState: EventCreationFeature.State(
//                        ecTitleFeature: EcTitleFeature.State(),
//                        ecDatePickerFeature: EcDatePickerFeature.State(),
//                        ecTypeFeature: EcTypeFeature.State(),
//                        ecHandleFeature: EcHandleFeature.State(),
//                        ecDescriptionFeature: EcDescriptionFeature.State(),
//                        ecCoverImageFeature: EcCoverImageFeature.State(),
//                        ecCongratsAlertFeature: EcCongratsAlertFeature.State()
//                    )) {
//                        EventCreationFeature()
//                    }
//                )
//            }
        }
    }
}

#Preview {
    EmptyEventView(store: Store(
        initialState:
            EventFloatingFeature.State()) {
                EventFloatingFeature()
            }
    )
}

