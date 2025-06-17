import SwiftUI

struct AuthView: View {
    @Binding var isPresented: Bool
    @State private var isLoginMode = true
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Text(isLoginMode ? "Login" : "Register")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(ClearCartTheme.primary)
                    .padding(.top, 32)

                VStack(spacing: 18) {
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(ClearCartTheme.accent)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(ClearCartTheme.primary.opacity(0.2), lineWidth: 1))
                        .foregroundColor(ClearCartTheme.secondary)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(ClearCartTheme.accent)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(ClearCartTheme.primary.opacity(0.2), lineWidth: 1))
                        .foregroundColor(ClearCartTheme.secondary)

                    if !isLoginMode {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .padding()
                            .background(ClearCartTheme.accent)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(ClearCartTheme.primary.opacity(0.2), lineWidth: 1))
                            .foregroundColor(ClearCartTheme.secondary)
                    }
                }

                Button(action: { isPresented = false }) {
                    Text(isLoginMode ? "Log In" : "Register")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(ClearCartTheme.primary)
                        .foregroundColor(ClearCartTheme.accent)
                        .cornerRadius(10)
                }
                .padding(.top, 10)

                Button(action: { isLoginMode.toggle() }) {
                    Text(isLoginMode ? "Don't have an account? Register" : "Already have an account? Login")
                        .font(.system(size: 15))
                        .foregroundColor(ClearCartTheme.secondary.opacity(0.5))
                }

                Spacer()
            }
            .padding(25)
            .background(ClearCartTheme.accent.edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
        }
    }
}
