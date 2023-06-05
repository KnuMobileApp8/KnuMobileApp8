//
//  DisplayView.swift
//  KnuMobileApp8
//
//  Created by 안지우 on 2023/06/05.
//

import SwiftUI

struct DisplayView: View {
    @ObservedObject var mapController : MapController
    
    var body: some View {
        VStack {
            //TODO: update the displayview
            HStack(alignment: .top){
                VStack(alignment: .leading) {
                    Text (mapController.selectedDisplayName)
                        .font(.title)
                    
                    Text(mapController.selectedDisplayPlacemark)
                }
                
                Spacer()
                Button {
                    mapController.isDisplayViewShowing.toggle()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
            
            HStack{
                ForEach(mapController.actions) { action in
                    Button {
                        action.handler()
                    } label: {
                        VStack {
                            Image(systemName: action.image)
                            Text(action.title)
                        }
                        .frame(maxWidth:.infinity)
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
        .padding()
    }
}

struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(mapController: MapController())
            .previewLayout(.sizeThatFits)
    }
}

