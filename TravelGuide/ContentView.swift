//
//  ContentView.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/2/25.
//


//Hi this is Navya 
//i love lady gaga

import SwiftUI

struct ContentView: View {
    @State private var mainPage = false
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to...")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("NOVI")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Button(action: {
                    mainPage = true
                }) {
                    Text("Click to enter Experience")
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                }
            }
            .navigationDestination(isPresented: $mainPage) {
                FirstView()
            }
            
            
        }
    }
}


#Preview {
    ContentView()
}
