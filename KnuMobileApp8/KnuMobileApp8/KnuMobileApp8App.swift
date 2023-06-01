//
//  KnuMobileApp8App.swift
//  KnuMobileApp8
//
//  Created by Dean on 2023/05/03.
//

import SwiftUI

@main
struct KnuMobileApp8App: App {
    var body: some Scene {
        WindowGroup {
            DisplayListView()
                .environmentObject(DisplayModel())
        }
    }
}

