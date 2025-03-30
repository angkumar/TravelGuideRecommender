//
//  schooldirections.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/30/25.
//

import SwiftUI

struct schooldirections: View {
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        school1(locationManager: locationManager)
                    .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    schooldirections()
}
