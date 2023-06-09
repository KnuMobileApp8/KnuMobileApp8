//
//  DisplayListView.swift
//  KnuMobileApp8
//
//  Created by Dean on 2023/05/17.
//

import SwiftUI

struct DisplayListView: View {
    @EnvironmentObject private var info: DisplayModel
    
    var body: some View {
        NavigationView {
            VStack() {
                List(info.displays) { display in
                    NavigationLink(destination: DetailView(Data: display)) {
                        DisplayRow(display: display)
                            .listRowInsets(EdgeInsets())
                            .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                                return 0
                            }
                    }
                }.navigationTitle("전시/공연")
            }
        }
        
    }
}

struct DisplayListView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayListView()
            .environmentObject(DisplayModel())
    }
}
