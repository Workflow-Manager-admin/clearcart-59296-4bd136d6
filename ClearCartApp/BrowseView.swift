import SwiftUI

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let menu: [MenuItem]
}

struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
}

let sampleRestaurants = [
    Restaurant(name: "Sunset Diner", description: "American classics with modern flavor.", menu: [
        MenuItem(name: "Classic Burger", price: 7.49),
        MenuItem(name: "Fries", price: 2.99),
        MenuItem(name: "Milkshake", price: 3.99)
    ]),
    Restaurant(name: "Veggie Bite", description: "Fresh, healthy & vegetarian.", menu: [
        MenuItem(name: "Falafel Wrap", price: 5.99),
        MenuItem(name: "Quinoa Bowl", price: 8.99)
    ])
]
// PUBLIC_INTERFACE
struct BrowseView: View {
    @State private var selectedRestaurant: Restaurant? = nil
    @State private var showMenuSheet = false

    var body: some View {
        NavigationView {
            List(sampleRestaurants) { restaurant in
                Button(action: {
                    selectedRestaurant = restaurant
                    showMenuSheet = true
                }) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(restaurant.name)
                                .font(.headline)
                                .foregroundColor(ClearCartTheme.secondary)
                            Text(restaurant.description)
                                .font(.subheadline)
                                .foregroundColor(ClearCartTheme.primary)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(ClearCartTheme.primary.opacity(0.6))
                    }
                    .padding(.vertical, 8)
                }
                .listRowBackground(ClearCartTheme.accent)
            }
            .background(ClearCartTheme.accent)
            .listStyle(PlainListStyle())
            .navigationTitle("Browse")
            .sheet(isPresented: $showMenuSheet) {
                if let restaurant = selectedRestaurant {
                    MenuView(restaurant: restaurant, isPresented: $showMenuSheet)
                }
            }
        }
    }
}

struct MenuView: View {
    let restaurant: Restaurant
    @Binding var isPresented: Bool
    @State private var addedToCart: [MenuItem] = []

    var body: some View {
        NavigationView {
            List(restaurant.menu) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .foregroundColor(ClearCartTheme.secondary)
                        Text("$\(String(format: "%.2f", item.price))")
                            .font(.caption)
                            .foregroundColor(ClearCartTheme.primary)
                    }
                    Spacer()
                    Button(action: {
                        addedToCart.append(item)
                        // In real code, add item to global cart state
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(ClearCartTheme.primary)
                    }
                }.padding(.vertical, 8)
            }
            .navigationTitle(restaurant.name)
            .navigationBarItems(trailing: Button("Done") { isPresented = false })
        }
    }
}
