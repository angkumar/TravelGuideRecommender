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
                Text("Location access denied. Please enable it in settings.")
            } else if let latitude = locationManager.latitude, let longitude = locationManager.longitude {
                Text("Latitude: \(latitude)")
                Text("Longitude: \(longitude)")
            } else {
                Text("Fetching location...")
            }
        }
        .padding()
    }
}

#Preview {
    LocationTracker()
}
