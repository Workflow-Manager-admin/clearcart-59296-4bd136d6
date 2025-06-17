import SwiftUI

struct RootContainerView: View {
    @State private var selectedTab: Tab = .browse
    @State private var showAuth: Bool = true // Show auth modal if not authenticated

    enum Tab {
        case browse, orders, profile
    }

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                BrowseView()
                    .tabItem {
                        Image(systemName: "cart")
                        Text("Browse")
                    }
                    .tag(Tab.browse)
                OrdersView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Orders")
                    }
                    .tag(Tab.orders)
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
                    .tag(Tab.profile)
            }
            .accentColor(ClearCartTheme.primary)
            .background(ClearCartTheme.accent.edgesIgnoringSafeArea(.all))
        }
        .sheet(isPresented: $showAuth) {
            AuthView(isPresented: $showAuth)
        }
    }
}

// PUBLIC_INTERFACE
struct RootContainerView_Previews: PreviewProvider {
    static var previews: some View {
        RootContainerView()
    }
}
