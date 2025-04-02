//
//  B1Directions.swift
//  TravelGuide
//
//  Created by Angad Kumar on 4/2/25.
//

import SwiftUI

struct B1Directions: View {
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        B1(locationManager: locationManager)
                    .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    B1Directions()
}
