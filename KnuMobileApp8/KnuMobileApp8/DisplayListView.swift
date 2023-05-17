//
//  DisplayListView.swift
//  KnuMobileApp8
//
//  Created by Dean on 2023/05/17.
//

import SwiftUI

struct DisplayListView: View {
    var body: some View {
        
        VStack() {
            List(displays) { display in
                DisplayRow(display: display)
                    .listRowInsets(EdgeInsets())
                    .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                        return 0
                    }
            }
        }
    }
}

struct DisplayListView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayListView()
    }
}
