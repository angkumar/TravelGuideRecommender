//
//  FirstView.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/7/25.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        TabView {
            MainScreen()
                .tabItem {
                    Label("Main", systemImage: "house")
                }
            MainMap(locationManager: LocationManager())
                .tabItem {
                    Label("Whole Map", systemImage: "map")
                }
//            Map2()
//                .tabItem {
//                    Label("Test", systemImage: "map")
//                }
            Options()
                .tabItem {
                    Label("Options", systemImage: "gear")
                }
//            LocationTracker()
//                .tabItem {
//                    Label("Location Tracker", systemImage: "location")
//                }
        }
    }
}

#Preview {
    FirstView()
}
