//
//  fun3.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/27/25.
//

import SwiftUI

struct fun3: View {
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        fun2(locationManager: locationManager)
                    .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    fun3()
}
