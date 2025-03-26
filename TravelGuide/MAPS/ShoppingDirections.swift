//
//  ShoppingDirections.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/25/25.
//

import SwiftUI

struct ShoppingDirections: View {
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        ShoppingMap(locationManager: locationManager)
                    .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ShoppingDirections()
}
