//
//  HomeDirections.swift
//  TravelGuide
//
//  Created by Angad Kumar on 4/12/25.
//

import SwiftUI

struct HomeDirections: View {
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        house1(locationManager: locationManager)
                    .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    HomeDirections()
}
