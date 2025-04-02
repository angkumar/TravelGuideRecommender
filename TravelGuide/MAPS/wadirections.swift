//
//  wadirections.swift
//  TravelGuide
//
//  Created by Angad Kumar on 4/2/25.
//

import SwiftUI

struct wadirections: View {
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        wa1(locationManager: locationManager)
                    .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    wadirections()
}
