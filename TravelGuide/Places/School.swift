//
//  School.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/30/25.
//

import SwiftUI
import MapKit

struct School: View {
    var body: some View {
        NavigationView {
            ScrollView{
                Text("Go To School")
                    .font(.largeTitle)
                    .padding(20)
                
                Image("school1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(width: 400, height: 300)
                Text("School is very important to go to as it helps you to learn new things and grow up. You will learn all kinds of things, from cooking to filing and even how to do your taxes.")
                    .frame(width: 400)
                Text("Rated one of the top schools in the tri-city area.")
                    .frame(width: 400)
                Image("school2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(width: 500, height: 300)
                
                Text("Location:")
                    .padding(.top, 20)
                Map() {
                    Marker("School", coordinate: CLLocationCoordinate2D(latitude: 42.46348341931742, longitude: -83.49242852247214))
                }
                .frame(width: 400, height: 300)
                .cornerRadius(20)
                .mapStyle(.hybrid)
                
                NavigationLink(destination: schooldirections().edgesIgnoringSafeArea(.all)) {
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
    School()
}
