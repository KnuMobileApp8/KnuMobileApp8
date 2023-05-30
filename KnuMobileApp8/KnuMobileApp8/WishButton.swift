//
//  WishButton.swift
//  KnuMobileApp8
//
//  Created by Dean on 2023/05/30.
//

import SwiftUI

struct WishButton: View {
    @EnvironmentObject private var info: DisplayModel
    let display: Display
    
    private var imageName: String {
        display.isWished ? "heart.fill" : "heart"
    }
    
    var body: some View {
        Image(systemName: imageName)
            .frame(width: 32, height: 32)
            .imageScale(.medium)
            .foregroundColor(.red)
            .onTapGesture {
                self.info.toggleWish(of: self.display)
            }
    }
}

struct WishButton_Previews: PreviewProvider {
    static var previews: some View {
        WishButton(display: displaySamples[0])
    }
}
