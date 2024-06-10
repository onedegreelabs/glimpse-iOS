import SwiftUI
import ComposableArchitecture

struct CustomNaviBar: View {
    
    @Binding var selectedTab: Tab
    @Binding var isSideMenuPresented: Bool
    @State var navigationText: String
    var body: some View {
        switch selectedTab {
        case .first, .second, .third:
            HStack {
                Image("logo")
                    .resizable()
                    .frame(width: 123, height: 24)
                Spacer()
        
                Button {
                    isSideMenuPresented = true
                } label: {
                    Image("Menu")
                }
                .fullScreenCover(isPresented: $isSideMenuPresented) {
                    CustomSideMenu(isSideMenuPresented: $isSideMenuPresented)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .background(Color.white)
                        .zIndex(1)

                }
              
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(height: 60, alignment: .center)
            .background(.white)
        case .fourth:
            // MARK: To Do: user name 저장해서 적용
            HStack {
                Text("Hi, Glimpse 👋")
                    .font(.pretendard(.semibold, size: 20))
        
                Spacer()
                
                Button {
                    isSideMenuPresented = true
                } label: {
                    Image("Menu")
                }
                .fullScreenCover(isPresented: $isSideMenuPresented) {
                    CustomSideMenu(isSideMenuPresented: $isSideMenuPresented)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .background(Color.white)
                        .zIndex(1)

                }
            }
        }
    }
}
