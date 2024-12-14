//
//  LoginView.swift
//  todo
//
//  Created by USER on 2024/12/14.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var showError: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                // 背景グラデーション
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.green.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 30) {
                    // タイトルセクション
                    VStack(spacing: 10) {
                        Text("TODO App")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Text("Welcome to TODO App")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }

                    // 入力フィールドセクション
                    VStack(spacing: 15) {
                        TextField("🙂User Name", text: $username)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .keyboardType(.asciiCapable)
                            .textInputAutocapitalization(.never)

                        SecureField("🔒Password", text: $password)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 30)

                    Button(action: {
                        login()
                    }) {
                        Text("Login")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(
                                gradient: Gradient(colors: [Color.blue, Color.purple]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 30)

                    // エラーメッセージ
                    if showError {
                        Text("ユーザー名またはパスワードが間違っています。")
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.top, -10)
                    }

                    Spacer()
                }
                .padding(.top, 50)
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                TopView()
            }
        }
    }

    func login() {
        if username == "" && password == "" {
            isLoggedIn = true
        } else {
            showError = true
        }
    }
}

#Preview {
    LoginView()
}
