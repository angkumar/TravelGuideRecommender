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
    @State private var homeExpanded = false
    @State private var eatExpanded = false
    @State private var shoppingExpanded = false
    @State private var funExpanded = false
    @State private var schoolExpanded = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List {
                    PromoSliderView()
                        .cornerRadius(20)
                        .frame(width: 400, height: 350)
                    
                    Text("Where do you want to go in Novi?")
                        .font(.largeTitle)
                    
                    DisclosureGroup("Home", isExpanded: $homeExpanded) {
                        NavigationLink(destination: Home()) {
                            Label("Take me home", systemImage: "house.fill")
                        }
                    }
                    
                    DisclosureGroup("School", isExpanded: $schoolExpanded) {
                        NavigationLink(destination: School()) {
                            Label("School", systemImage: "graduationcap.fill")
                        }
                    }
                    
                    DisclosureGroup("Go Eat", isExpanded: $eatExpanded) {
                        NavigationLink(destination: FoodOG()) {
                            Label("I want Italian", systemImage: "wineglass")
                        }
                    }
                    
                    DisclosureGroup("Shopping", isExpanded: $shoppingExpanded) {
                        NavigationLink(destination: Shopping1()) {
                            Label("Budget shopping", systemImage: "dollarsign.circle")
                        }
                        NavigationLink(destination: Shopping2()) {
                            Label("Ballers only", systemImage: "banknote")
                        }
                    }
                    
                    DisclosureGroup("Fun", isExpanded: $funExpanded) {
                        NavigationLink(destination: fun()) {
                            Label("Click for fun", systemImage: "gamecontroller.fill")
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle()) // Better for iOS UI
                .frame(width: .infinity, height: .infinity)
            }
            .navigationTitle("Things to do in Novi!")
            //                        Text("Go Home")
            //                            .font(.title)
            //                            .padding()
            //
            //                        Button(action: {
            //                            navigateToSecondPage = true
            //                        }) {
            //                            Text("More details")
            //                                .padding()
            //                                .background(Color.blue)
            //                                .foregroundColor(.white)
            //                                .clipShape(Capsule())
            //                                .shadow(radius: 5)
            //                        }
            //                    }
            //                    .navigationTitle("Things to do in Novi!")
            //                    .navigationDestination(isPresented: $navigateToSecondPage) {
            //                        Home()
            //                    }
            //                    VStack{
            //                        Text("Go Eat")
            //                            .font(.title)
            //                            .padding()
            //
            //                        Button(action: {
            //                            navigateToThirdPage = true
            //                        }) {
            //                            Text("More details")
            //                                .padding()
            //                                .background(Color.blue)
            //                                .foregroundColor(.white)
            //                                .clipShape(Capsule())
            //                                .shadow(radius: 5)
            //                        }
            //                    }
            //                    .navigationTitle("Things to do in Novi!")
            //
            //                        FoodOG()
            //
            //
            //                    }
            //                    VStack{
            //                        Text("Go Shopping!")
            //                            .font(.title)
            //                            .padding()
            //
            //                        Button(action: {
            //                            navigateToFourthPage = true
            //                        }) {
            //                            Text("Budget Shoping")
            //                                .padding()
            //                                .background(Color.blue)
            //                                .foregroundColor(.white)
            //                                .clipShape(Capsule())
            //                                .shadow(radius: 5)
            //                        }
            //                        Button(action: {
            //                            navigateToFifthPage = true
            //                        }) {
            //                            Text("If ur a Baller")
            //                                .padding()
            //                                .background(Color.blue)
            //                                .foregroundColor(.white)
            //                                .clipShape(Capsule())
            //                                .shadow(radius: 5)
            //                        }
            //                    }
            //                    .navigationTitle("Things to do in Novi!")
            //                    .navigationDestination(isPresented: $navigateToFourthPage) {
            //                        Shopping1()
            //                    }
            //                    .navigationDestination(isPresented: $navigateToFifthPage) {
            //                        Shopping2()
            //                    }
            //                    VStack{
            //                        Text("Fun")
            //                            .font(.title)
            //                            .padding()
            //
            //                        Button(action: {
            //                            navigateToSixthPage = true
            //                        }) {
            //                            Text("Fun")
            //                                .padding()
            //                                .background(Color.blue)
            //                                .foregroundColor(.white)
            //                                .clipShape(Capsule())
            //                                .shadow(radius: 5)
            //                        }
            //                    }
            //                    .navigationTitle("Things to do in Novi!")
            //                    .navigationDestination(isPresented: $navigateToSixthPage) {
            //                        fun()
        }
    }
}


#Preview {
    MainScreen()
}
