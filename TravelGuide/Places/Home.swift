//
//  Home.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/2/25.
//

import SwiftUI
import MapKit


struct Home: View {
    var body: some View {
        ScrollView {
            Text("Home")
                .font(.largeTitle)
                .padding()
            
            Text("This is the place you call home")
            
            Image("home")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .frame(width: 400, height: 300)
            
            Map() {
                Marker("Home", coordinate: CLLocationCoordinate2D(latitude: 42.485984063745754, longitude: -83.53735398714915))
            }
            .frame(height: 300)
            .cornerRadius(20)
            .mapStyle(.hybrid)
            
            Text("Here you want all your favourite places, like your bed, bathroom, kitchen and so on.")
        }
    }
}

#Preview {
    Home()
}
