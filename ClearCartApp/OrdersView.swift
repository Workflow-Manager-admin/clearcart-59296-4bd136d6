import SwiftUI

struct Order: Identifiable {
    let id = UUID()
    let date: Date
    let items: [MenuItem]
    let status: String
    let total: Double
}

let sampleOrders = [
    Order(date: Date(), items: [MenuItem(name: "Classic Burger", price: 7.49)], status: "Preparing", total: 7.49+2.00),
]

// PUBLIC_INTERFACE
struct OrdersView: View {
    let orders = sampleOrders

    var body: some View {
        NavigationView {
            List(orders) { order in
                VStack(alignment: .leading, spacing: 5) {
                    Text("Order \(order.id.uuidString.prefix(5))")
                        .font(.headline)
                        .foregroundColor(ClearCartTheme.secondary)
                    Text(order.items.map { $0.name }.joined(separator: ", "))
                        .foregroundColor(ClearCartTheme.primary)
                    Text("Status: \(order.status)")
                        .font(.caption)
                        .foregroundColor(ClearCartTheme.primary.opacity(0.7))
                    HStack {
                        Text("Total:")
                        Spacer()
                        Text("$\(String(format: "%.2f", order.total))")
                            .foregroundColor(ClearCartTheme.secondary)
                    }
                    .font(.subheadline)
                }
                .padding(.vertical, 8)
                .listRowBackground(ClearCartTheme.accent)
            }
            .navigationTitle("Orders")
            .background(ClearCartTheme.accent)
            .listStyle(PlainListStyle())
        }
    }
}
