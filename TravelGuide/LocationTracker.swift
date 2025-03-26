//
//  LocationTracker.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/25/25.
//

import SwiftUI

struct LocationTracker: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
            VStack {
                if locationManager.authorizationStatus == .denied {
                    Text("Location access denied. Please enable it in       settings.")
                } else {
                    Text("Latitude: \(locationManager.latitude)")
                    Text("Longitude: \(locationManager.longitude)")
                }
            }
        }
    
    }


#Preview {
    LocationTracker()
}
