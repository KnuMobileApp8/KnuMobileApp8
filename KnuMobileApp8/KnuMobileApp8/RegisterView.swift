//
//  RegisterView.swift
//  KnuMobileApp8
//
//  Created by dohun on 2023/05/19.
//

import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @State var pw = ""
    @State var nickname = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isRegistering = false // 회원가입 상태를 나타내는 변수
    @Environment(\.dismiss) private var dismiss
    @State private var passwordConfirmText: String = ""   // 패스워드 확인 Text
    @State var isShowingProgressView = false                   // 로그인 비동기 ProgressView
    @State var isShowingAlert: Bool = false                     // 로그인 완료 Alert
    @State var isPasswordCountError: Bool = false               // 비밀번호 6자리 이상 확인
    @State var isPasswordUnCorrectError: Bool = false             // 비밀번호 텍스트 일치 확인
    @State var isEmailError: Bool = false                       // 이메일 에러
    @State var emailErrorText: String = ""                      // 이메일 에러 Text
    
    var body: some View {
        ScrollView{
            VStack(spacing: 30) {
                VStack {
                    Text("LOGO")
                        .font(.largeTitle)
                }
                .lineSpacing(10)
                
                VStack(alignment: .leading) {
                    Text("닉네임")
                        .font(.headline)
                    TextField("닉네임을 입력해주세요.", text: $nickname)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                }
                VStack(alignment: .leading) {
                    Text("이메일")
                        .font(.headline)
                    TextField("이메일을 입력해주새요.", text: $email)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                }
                VStack(alignment: .leading) {
                    Text("비밀번호")
                    SecureField("Nickname", text: $pw)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(10)
                }
                VStack(alignment: .leading) {
                    Text("비밀번호 확인")
                    SecureField("비밀번호를 다시 입력해주세요", text: $passwordConfirmText)
                        .padding()
                        .background(.thinMaterial)
                        .border(.red, width: passwordConfirmText != pw ? 1 : 0)
                        .cornerRadius(10)
                }
                Button {
                    isShowingProgressView = true // ProgressView 보이기
                    
                    if pw.count < 6 {
                        isPasswordCountError = true
                    }
                    if passwordConfirmText != pw {
                        isPasswordUnCorrectError = true
                    }
                    if pw.count >= 6 && passwordConfirmText == pw {
                        viewModel.registerUser(nickname: nickname, email: email, password: pw)
                        isShowingAlert = true
                    }
                } label: {
                    Capsule()
                        .fill(Color(hex: "#478AC6"))
                        .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
                        .overlay(Text("회원가입")
                            .font(.system(size: 20)).fontWeight(.medium)
                            .foregroundColor(Color.white))
                        .padding(.vertical, 2)
                        .alert("회원가입", isPresented: $isShowingAlert) {
                            Button {
                                dismiss()
                            } label: {
                                Text("OK")
                            }
                        } message: {
                            Text("회원가입이 완료되었습니다.")
                        }
                        .padding()
                    //                Text("회원 가입")
                    //                    .background(!checkSignUpCondition() ? .gray : .blue)
                    //                    .foregroundColor(.white)
                    //                    .cornerRadius(10)
                    //                    .alert("회원가입", isPresented: $isShowingAlert) {
                    //                        Button {
                    //                            dismiss()
                    //                        } label: {
                    //                            Text("OK")
                    //                        }
                    //                    } message: {
                    //                        Text("회원가입이 완료되었습니다.")
                    //                    }
                    //                    .padding()
                }
                .disabled(!checkSignUpCondition() ? true : false)
                
                //(2)
                if isShowingProgressView {
                    ProgressView()
                }
                
                //            Button (action: {
                //                viewModel.registerUser(nickname: nickname, email: email, password: pw)
                //            }) {
                //                Capsule()
                //                    .fill(Color(hex: "#478AC6"))
                //                    .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
                //                    .overlay(Text("회원가입")
                //                        .font(.system(size: 20)).fontWeight(.medium)
                //                        .foregroundColor(Color.white))
                //                    .padding(.vertical, 2)
                //
                //            }
                //            .padding()
                
            }
        }
    }
    
    func checkSignUpCondition () -> Bool {
        if nickname.isEmpty || email.isEmpty || pw.isEmpty || passwordConfirmText.isEmpty {
            return false
        }
        return true
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
