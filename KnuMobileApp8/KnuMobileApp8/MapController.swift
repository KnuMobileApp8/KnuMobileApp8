//
//  MapController.swift
//  KnuMobileApp8
//
//  Created by 안지우 on 2023/06/05.
//

import MapKit

class MapController: ObservableObject{
    var searchTerm = String()
    @Published var isDisplayViewShowing = false
    @Published private(set) var display = [Display]()
    @Published private(set) var selectedDisplay: Display?
    @Published private(set) var actions = [Action]()
    
    var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:47.6062, longitude:-122.3321), latitudinalMeters: 1600, longitudinalMeters: 1600)
    
    var selectedDisplayName: String {
        guard let selectedDisplay = selectedDisplay else {return ""}
        return selectedDisplay.eventGubunName
    }
    
    var selectedDisplayPlacemark: String {
        guard let selectedDisplay = selectedDisplay else {return ""}
        return selectedDisplay.placemark?.title ?? "??"
    }
    
    func search() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTerm
        request.region = region
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response else { return }
            
            DispatchQueue.main.async {
                self.self.self.self.display = response.mapItems.map{ item in
                    Display(endDate: "String", payGubunName: "String", payGubun: "String", subject: "String", place: "<#String#>", content: JSONNull(), eventGubunName: "String", eventGubun: "String", startDate: "String", placemark: item.placemark, coordinate: item.placemark.coordinate)
                }
            }
        }
        createAction()
    }
    
    func openMap(coordinate: CLLocationCoordinate2D) {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.openInMaps()
    }
    
    func setSelectedDisplay(for display : Display) {
        selectedDisplay = display
        isDisplayViewShowing.toggle()
    }
    
    func createAction(){
        actions = [
            Action(title: "Directions", image: "car.fill") { [weak self] in
                guard let self = self else { return }
                self.openMap(coordinate: self.selectedDisplay!.coordinate!)
            },
            //add action to open calendar
        ]
    }
}
