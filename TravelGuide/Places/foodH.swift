//
//  foodH.swift
//  TravelGuide
//
//  Created by Angad Kumar on 4/1/25.
//

import SwiftUI
import MapKit

struct foodH: View {
    var body: some View {
        NavigationView {
            ScrollView{
                Text("Hibatchi Cooking")
                    .font(.largeTitle)
                    .padding(20)
                Text("Wasabi/Benihana")
                    .font(.largeTitle)
                    .padding(20)
                
                Image("wasabi")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(width: 450, height: 300)
                Text("Hibatchi-style cooking is a style of cooking where the food is cooked infront of you")
                    .frame(width: 400)
                Image("fire")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(width: 400, height: 300)
                Text("These two restaurant are Knows for their Hibatchi-style cooking. This is at least a once in a lifetime experience")
                    .frame(width: 400)
                
                
                Text("Location for Wasabi:")
                    .padding(.top, 20)
                Map() {
                    Marker("Wasabi", coordinate: CLLocationCoordinate2D(latitude: 42.47817748103027,  longitude: -83.46174312420216))
                }
                .frame(width: 400, height: 300)
                .cornerRadius(20)
                .mapStyle(.hybrid)
                
                NavigationLink(destination: wadirections().edgesIgnoringSafeArea(.all)) {
                    Text("Click here for directions to wasabi")
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                }
                
                Text("Location for Benihana:")
                Map() {
                    Marker("Benihana", coordinate: CLLocationCoordinate2D(latitude: 42.44340310410907, longitude:
                        -83.43302752417712))
                }
                .frame(width: 400, height: 300)
                .cornerRadius(20)
                .mapStyle(.hybrid)
                
                NavigationLink(destination: B1Directions().edgesIgnoringSafeArea(.all)) {
                    Text("Click here for directions to Benihana")
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
    foodH()
}
