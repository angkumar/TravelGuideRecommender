//
//  FoodOGMap2.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/22/25.
//
// im testing git pushing solo

import SwiftUI

struct FoodOGMap2: View {
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        FoodOGMap(locationManager: locationManager)
                    .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    FoodOGMap2()
}
