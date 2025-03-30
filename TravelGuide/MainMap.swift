//
//  MainMap.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/7/25.
//

import SwiftUI
import MapKit

struct MainMap: View {
    
    @State private var route: MKRoute?
    @ObservedObject var locationManager: LocationManager
    var body: some View {
        Map() {
            Marker("Olive Garden", coordinate: CLLocationCoordinate2D(latitude: 42.4851700905243, longitude: -83.4741130123747))
            
            Marker("Home", coordinate: CLLocationCoordinate2D(latitude: 42.485984063745754, longitude: -83.53735398714915))
            
            Marker("WalMart", coordinate: CLLocationCoordinate2D(latitude: 42.48180223947649, longitude: -83.47077933339779))
            
            Marker("Twelve Oaks Mall", coordinate: CLLocationCoordinate2D(latitude: 42.49188857396703, longitude: -83.47064573617806))
            
            Marker("Suburban Collection Showplace", coordinate: CLLocationCoordinate2D(latitude: 42.489293731285684, longitude: -83.50238818400035))
            Marker("Me", coordinate: CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude))
            Marker("School", coordinate: CLLocationCoordinate2D(latitude: 42.46348341931742, longitude:  -83.49242852247214))
                
            
            
            if let route {
                MapPolyline(route)
                    .stroke(Color.blue, lineWidth: 4)
            }
        }
        
        
        .mapStyle(.hybrid)
        
    }
}

#Preview {
    MainMap(locationManager: LocationManager())
}
