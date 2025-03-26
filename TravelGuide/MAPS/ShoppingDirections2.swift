//
//  ShoppingDirections2.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/25/25.
//

import SwiftUI

struct ShoppingDirections2: View {
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        ShoppingMap2(locationManager: locationManager)
                    .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ShoppingDirections2()
}
