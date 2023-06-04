//
//  Action.swift
//  KnuMobileApp8
//
//  Created by 안지우 on 2023/06/05.
//

import Foundation

struct Action: Identifiable {
    let id = UUID();
    let title: String
    let image: String
    let handler: () -> Void
}
