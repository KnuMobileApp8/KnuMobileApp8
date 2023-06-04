//
//  MapView.swift
//  KnuMobileApp8
//
//  Created by 안지우 on 2023/06/05.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var mapController: MapController
    
    var body: some View {
        Map(coordinateRegion: $mapController.region, annotationItems: mapController.display){
            display in
            MapAnnotation(coordinate: display.coordinate!){
                Image(systemName:"mappin.and.ellipse")
                    .font(.title)
                    .foregroundColor(.pink)
                    .onTapGesture {
                        mapController.setSelectedDisplay(for: display)
                    }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .sheet(isPresented: $mapController.isDisplayViewShowing){
            DisplayView(mapController: mapController)
                .presentationDetents([.fraction(0.27), .large])
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mapController: MapController())
    }
}
