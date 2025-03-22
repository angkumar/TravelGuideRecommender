//
//  Shopping1.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/7/25.
//

import SwiftUI
import MapKit

struct Shopping1: View {
    var body: some View {
        ScrollView {
            Text("Walmart")
                .font(.largeTitle)
                .padding()
            
            Text("This is the besst place in novi to buy groceries, clothes and so on.")
            
            Image("wm")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .frame(width: 400, height: 300)
            
            Text("Walmart has everything you need, from food to gasoline, from clotes to ipads, and so on.")

            Map() {
                Marker("WalMart", coordinate: CLLocationCoordinate2D(latitude: 42.48180223947649, longitude: -83.47077933339779))
            }
            .frame(height: 300)
            .cornerRadius(20)
            .mapStyle(.hybrid)
            
            Text("Here you want all your favourite places, like your bed, bathroom, kitchen and so on.")
        }
    }
}

#Preview {
    Shopping1()
}
