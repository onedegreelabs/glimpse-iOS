import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    
    var body: some View {
        WithPerceptionTracking {
            Text("Home 화면 준비중입니다.🏃")
                .font(.pretendard(.medium, size: 20))
        }
    }
}

#Preview {
    HomeView()
}
