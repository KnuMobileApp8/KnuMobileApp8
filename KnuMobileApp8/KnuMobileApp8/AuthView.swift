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
    
    var body: some View {
        
        VStack {
            TextField("Email", text: $email)
            SecureField("PW", text: $pw)
            
            VStack {
                Button {
                    viewModel.registerUser(email: email, password: pw)
                } label: {
                    Text("등록")
                }
                
                Button {
                    viewModel.login(email: email, password: pw)
                } label: {
                    Text("로그인")
                }
                
                Button {
                    viewModel.logout()
                } label: {
                    Text("로그아웃")
                }
            }
            Text(viewModel.currentUser?.uid ?? "비로그인")
                .padding()
        }
        .padding()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
