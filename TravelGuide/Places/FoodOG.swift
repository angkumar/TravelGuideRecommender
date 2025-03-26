//
//  FoodOG.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/2/25.
//

import SwiftUI
import MapKit

struct FoodOG: View {
    var body: some View {
        NavigationView {
            ScrollView{
                Text("Eat at Olive Garden!")
                    .font(.largeTitle)
                    .padding(20)
                
                Image("food1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(width: 400, height: 300)
                Text("Olive Garden is one of the Best Italian restaurants in the nearby regions.")
                    .frame(width: 400)
                Text("You can eat all the famous dishes and desserts that italy is famous for. From never-ending soups/salads to pasta, pizza, and breadsticks, you will find something to satisfy your cravings.")
                    .frame(width: 400)
                Image("Food2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(width: 500, height: 300)
                
                Text("Location:")
                    .padding(.top, 20)
                Map() {
                    Marker("Olive Garden", coordinate: CLLocationCoordinate2D(latitude: 42.4851700905243, longitude: -83.4741130123747))
                }
                .frame(width: 400, height: 300)
                .cornerRadius(20)
                .mapStyle(.hybrid)
                
                NavigationLink(destination: FoodOGMap2().edgesIgnoringSafeArea(.all)) {
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
    FoodOG()
}
