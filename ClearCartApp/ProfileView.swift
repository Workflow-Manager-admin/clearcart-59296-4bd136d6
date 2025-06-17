import SwiftUI

// PUBLIC_INTERFACE
struct ProfileView: View {
    @State private var userEmail = "hi@example.com"

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 28) {
                HStack {
                    Image(systemName: "person.crop.square")
                        .resizable()
                        .frame(width: 44, height: 44)
                        .foregroundColor(ClearCartTheme.primary)
                    VStack(alignment: .leading) {
                        Text("Logged in as")
                            .font(.caption)
                            .foregroundColor(ClearCartTheme.secondary)
                        Text(userEmail)
                            .font(.headline)
                            .foregroundColor(ClearCartTheme.primary)
                    }
                }
                .padding(.top, 42)
                Divider()
                Button(action: {}) {
                    Text("Manage Account")
                        .foregroundColor(ClearCartTheme.primary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(ClearCartTheme.accent)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(ClearCartTheme.primary, lineWidth: 1))
                }
                Button(action: {}) {
                    Text("Log out")
                        .foregroundColor(ClearCartTheme.secondary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(ClearCartTheme.primary)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .padding()
            .background(ClearCartTheme.accent.edgesIgnoringSafeArea(.all))
            .navigationTitle("Profile")
        }
    }
}
