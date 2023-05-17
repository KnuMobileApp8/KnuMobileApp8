//
//  DisplayRow.swift
//  KnuMobileApp8
//
//  Created by Dean on 2023/05/17.
//

import SwiftUI

struct DisplayRow: View {
    let display: Display
    
    var body: some View {
        HStack() {
            displayImage
            displayDescription
            Spacer()
            tailView
        }
        .frame(height: 160)
        .background(.white)
        .padding(.vertical, 0)
    }
}

private extension DisplayRow {
    var displayImage: some View {
        Image("image")
            .frame(width: 110, height: 130)
            .cornerRadius(10)
            .clipped()
    }
    
    var displayDescription: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(display.title)
                .font(.title)
                .padding(.bottom, 10)
            HStack {
                Image(systemName: "mappin")
                    .frame(width: 15)
                Text(display.place)
            }
            HStack {
                Image(systemName: "eye")
                    .frame(width: 15)
                Text(display.gubun)
            }
            HStack {
                Image(systemName: "calendar")
                    .frame(width: 15)
                Text(display.date)
            }
            HStack {
                Image(systemName: "wonsign")
                    .frame(width: 15)
                Text(display.price)
            }
        }
        .padding([.top, .bottom], 10)
        .padding(.leading, 5)
        .font(.footnote)
    }
    
    var tailView: some View {
        
        HStack(spacing: 10) {
            Image(systemName: "heart")
            Image(systemName: "greaterthan")
        }
        .frame(width: 35)
        .padding(.trailing, 10)
    }
}
struct DisplayRow_Previews: PreviewProvider {
    static var previews: some View {
        DisplayListView()
    }
}
