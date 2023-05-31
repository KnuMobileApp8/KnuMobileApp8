//
//  AuthViewModel.swift
//  KnuMobileApp8
//
//  Created by dohun on 2023/05/16.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var loginError: String = ""
    @Published var currentUser: Firebase.User?
    @State private var isLoggedIn = false

    init() {
        currentUser = Auth.auth().currentUser
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error : \(error.localizedDescription)")
                self.isLoggedIn = false // 로그인 실패 시 isLoggedIn 값을 false로 설정
                self.loginError = "Invalid email or password" // Set an error message to display in the view
                return
            }
            
            self.currentUser = result?.user
            self.isLoggedIn = true // 로그인 성공 시 전환

        }
    }
    
    func logout() {
        self.currentUser = nil
        self.isLoggedIn = false
        try? Auth.auth().signOut()
    }
    
    func registerUser(nickname: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error : \(error.localizedDescription)")
                return
            }
            if result != nil {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = nickname
            }
        }
    }
}
