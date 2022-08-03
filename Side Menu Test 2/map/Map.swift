//
//  Map.swift
//  Side Menu Test 2
//
//  Created by Victor Han on 2022/7/30.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 42.0558,
            longitude: -87.6743),
        span: MKCoordinateSpan(
            latitudeDelta: 0.05,
            longitudeDelta: 0.05)
    )
    
    @StateObject var locationManager = LocationManager()
    @State private var userTrackingMode:
    MapUserTrackingMode = .follow
    @State private var places = [Place]()
    @State var sportsType = ""
    var body: some View {
        Section {
            HStack{
                Text(" Sports type selection:")
                Picker("sports", selection: $sportsType) {
                        Text("Soccer").tag("soccer")
                        Text("Basketball").tag("basketball")
                        Text("Tennis").tag("tennis")
                        Text("Football").tag("football")
                }
                    .padding()
            }
        }
                Spacer()
        NavigationView {
            Map(coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode,
                annotationItems: places){ place in
                MapAnnotation(coordinate: place.annotation.coordinate){
                    NavigationLink(destination: LocationDetailsView(selectedMapItem: place.mapItem)){
                        if sportsType == "soccer" {
                            Image("soccer")
                        }
                       else if sportsType == "basketball" {
                            Image("basketball")
                        }
                       else if sportsType == "tennis" {
                            Image("tennis")
                        }
                        else {
                            Image("football")
                        }
                    }
                }
            }
                .onChange(of: sportsType, perform: { newValue in
                     performSearch(item: sportsType)
                 })
        }
        Spacer()
    }
        
    func performSearch(item: String){
        places.removeAll()
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = item
        searchRequest.region = region
        let search = MKLocalSearch(request:searchRequest)
        search.start {(response, error) in
            if let response = response{
                for mapItem in response.mapItems {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = mapItem.placemark.coordinate
                    annotation.title = mapItem.name
                    places.append(Place(annotation: annotation, mapItem: mapItem))
                }
            }
        }
    }

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

struct Place: Identifiable {
    let id = UUID()
    let annotation: MKPointAnnotation
    let mapItem: MKMapItem
}
}
