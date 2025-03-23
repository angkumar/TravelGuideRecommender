//
//  Shopping2.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/15/25.
//

import SwiftUI
import MapKit

struct Shopping2: View {
    var body: some View {
        NavigationView{
            ScrollView {
                Text("Twelve Oaks Mall")
                    .font(.largeTitle)
                    .padding()
                
                Text("This is the best place to waste thousands of dollars on anything you want/'need'")
                
                Image("tom")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(width: 400, height: 300)
                
                Text("Twelve Oaks Mall is a shopping mall with over 180 stores which is located in Novi, Michigan, United States, a suburb of Detroit. The mall features anchor stores JCPenney, Macy's, and Nordstrom, with two vacant anchors previously Lord & Taylor and Sears")

                Map() {
                    Marker("Twele oaks Mall", coordinate: CLLocationCoordinate2D(latitude: 42.49188857396703, longitude :-83.47064573617806))
                }
                .frame(height: 300)
                .cornerRadius(20)
                .mapStyle(.hybrid)
                
                NavigationLink(destination: ShoppingMap2().edgesIgnoringSafeArea(.all)) {
                    Text("Click here for directions.")
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                }

                
            }
        }
    }
}

#Preview {
    Shopping2()
}
