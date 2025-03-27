//
//  MainScreen.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/2/25.
//

import SwiftUI

struct MainScreen: View {
    
    @State private var navigateToSecondPage = false
    @State private var navigateToThirdPage = false
    @State private var navigateToFourthPage = false
    @State private var navigateToFifthPage = false
    @State private var navigateToSixthPage = false
    
    var body: some View {
        NavigationView {
            NavigationStack{
                ScrollView {
                    VStack {
                        Text("Go Home")
                            .font(.title)
                            .padding()
                        
                        Button(action: {
                            navigateToSecondPage = true
                        }) {
                            Text("More details")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                    .navigationTitle("Things to do in Novi!")
                    .navigationDestination(isPresented: $navigateToSecondPage) {
                        Home()
                    }
                    VStack{
                        Text("Go Eat")
                            .font(.title)
                            .padding()
                        
                        Button(action: {
                            navigateToThirdPage = true
                        }) {
                            Text("More details")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                    .navigationTitle("Things to do in Novi!")
                    .navigationDestination(isPresented: $navigateToThirdPage) {
                        FoodOG()
                        
                        
                    }
                    VStack{
                        Text("Go Shopping!")
                            .font(.title)
                            .padding()
                        
                        Button(action: {
                            navigateToFourthPage = true
                        }) {
                            Text("Budget Shoping")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                        Button(action: {
                            navigateToFifthPage = true
                        }) {
                            Text("If ur a Baller")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                    .navigationTitle("Things to do in Novi!")
                    .navigationDestination(isPresented: $navigateToFourthPage) {
                        Shopping1()
                    }
                    .navigationDestination(isPresented: $navigateToFifthPage) {
                        Shopping2()
                    }
                    VStack{
                        Text("Fun")
                            .font(.title)
                            .padding()
                        
                        Button(action: {
                            navigateToSixthPage = true
                        }) {
                            Text("Fun")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                    .navigationTitle("Things to do in Novi!")
                    .navigationDestination(isPresented: $navigateToSixthPage) {
                        fun()
                    }
                }
            }
        }
    }
}


#Preview {
    MainScreen()
}
