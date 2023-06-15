//
//  DisplayRow.swift
//  KnuMobileApp8
//
//  Created by Dean on 2023/05/17.
//

import SwiftUI

struct DisplayRow: View {
    var display: Display
    var randomInt = Int.random(in: 1...6)
    
    var body: some View {
        HStack {
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
        Image("\(randomInt)")
            .frame(width: 110, height: 130)
            .cornerRadius(10)
            .clipped()
    }
    
    var displayDescription: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(display.subject)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            HStack {
                Image(systemName: "mappin")
                    .frame(width: 15)
                Text(display.place)
                    .lineLimit(1)
            }
            HStack {
                Image(systemName: "eye")
                    .frame(width: 15)
                Text(display.eventGubunName)
            }
            HStack {
                Image(systemName: "calendar")
                    .frame(width: 15)
                VStack(alignment: .leading) {
                    Text(display.startDate + " ~")
                    Text(display.endDate)
                }
            }
            HStack {
                Image(systemName: "wonsign")
                    .frame(width: 15)
                Text(display.payGubunName)
            }
        }
        .padding([.top, .bottom], 10)
        .padding(.leading, 5)
        .font(.footnote)
    }
    
    var tailView: some View {
        WishButton(display: display)
            .frame(width: 5)
            .padding(.trailing, 10)
    }
}

struct DisplayRow_Previews: PreviewProvider {
    static var previews: some View {
        DisplayListView()
            .environmentObject(DisplayModel())
    }
}
