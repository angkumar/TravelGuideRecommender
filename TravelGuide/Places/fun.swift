//
//  fun.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/27/25.
//

import SwiftUI
import MapKit

struct fun: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Home")
                    .font(.largeTitle)
                    .padding()
                
                Text("This is the place you call home")
                
                Image("home")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(width: 400, height: 300)
                
                Map() {
                    Marker("Home", coordinate: CLLocationCoordinate2D(latitude: 40.74844079761186, longitude: -73.98569849282397))
                }
                .frame(height: 300)
                .cornerRadius(20)
                .mapStyle(.hybrid)
                
                Text("Here you want all your favourite places, like your bed, bathroom, kitchen and so on.")
                
                NavigationLink(destination: fun3().edgesIgnoringSafeArea(.all)) {
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
    fun()
}
