//
//  AuthView.swift
//  KnuMobileApp8
//
//  Created by dohun on 2023/05/16.
//

import SwiftUI

struct AuthView: View {
    
    @State var email = ""
    @State var pw = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isLoggedIn = false
    @State private var isRegistering = false // 회원가입 상태를 나타내는 변수
    
    var body: some View {
        NavigationView {
            VStack {
                Text("LOGO")
                    .font(.largeTitle)
                    .lineSpacing(10)
                
                VStack {
                    TextField("이메일을 입력하세요.", text: $email)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                    SecureField("비밀번호를 입력하세요.", text: $pw)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .padding(.bottom, 30)
                    
                    VStack {
                        Button(action: {
                            viewModel.login(email: email, password: pw)
                            if viewModel.currentUser != nil {
                                isLoggedIn = true // Set isLoggedIn value to true when login is successful
                            } else {
                                // handle login failure
                                print("login failed")
                                isLoggedIn = false
                            }
                        }) {
                            Capsule()
                                .fill(Color(hex: "#478AC6"))
                                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
                                .overlay(Text("로그인")
                                    .font(.system(size: 20)).fontWeight(.medium)
                                    .foregroundColor(Color.white))
                                .padding(.vertical, 2)
                        }
                        //                    .buttonStyle(ShrinkButtonStyle())
                        .padding()
                        
                        Button (action: {
                            isRegistering = true // 회원가입 버튼을 누르면 isRegistering을 true로 설정하여 RegisterView로 전환
                        }) {
                            Capsule()
                                .fill(Color(hex: "#478AC6"))
                                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
                                .overlay(Text("회원가입")
                                    .font(.system(size: 20)).fontWeight(.medium)
                                    .foregroundColor(Color.white))
                                .padding(.vertical, 2)
                        }
                        //                    .buttonStyle(ShrinkButtonStyle())
                        .padding()
                        
                        
                        
//                        Button {
//                            viewModel.logout()
//                        } label: {
//                            Text("로그아웃")
//                        }
                    }
                    // 로그인이 성공하면 ContentView로 전환됨
                    NavigationLink(destination: SettingView(), isActive: $isLoggedIn) {
                        EmptyView()
                    }
                    .hidden()
                    NavigationLink(destination: RegisterView(), isActive: $isRegistering) {
                        EmptyView()
                    }
                    .hidden()
                    
                }
                .padding()
            }
            
        }
    }
    
    struct AuthView_Previews: PreviewProvider {
        static var previews: some View {
            AuthView()
        }
    }
}
