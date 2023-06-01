//
//  WishListView.swift
//  KnuMobileApp8
//
//  Created by Dean on 2023/05/30.
//

import SwiftUI

struct WishListView: View {
    @EnvironmentObject private var info: DisplayModel
    
    var body: some View {
        NavigationView {
            VStack() {
                List(info.displays) { display in
                    if display.isWished {
                        // 상세정보 연결 필요
                        NavigationLink(destination: Text(display.place)) {
                            DisplayRow(display: display)
                                .listRowInsets(EdgeInsets())
                                .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                                    return 0
                                }
                        }
                    }
                }.navigationTitle("찜목록")
            }
        }
        
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView()
            .environmentObject(DisplayModel())
    }
}
