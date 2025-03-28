//
//  SwiftUIView.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/28/25.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var homeExpanded = false
    @State private var eatExpanded = false
    @State private var shoppingExpanded = false
    @State private var funExpanded = false
    
    var body: some View {
        
        List {
            
            Text("Where do you want to go")
                .font(.largeTitle)
            
            DisclosureGroup("Home", isExpanded: $homeExpanded) {
                NavigationLink(destination: Home()) {
                    Label("Take me home", systemImage: "house.fill")
                }
            }
            
            DisclosureGroup("Go Eat", isExpanded: $eatExpanded) {
                NavigationLink(destination: FoodOG()) {
                    Label("I want italian", systemImage: "wineglass")
                }
            }
            
            DisclosureGroup("Shopping", isExpanded: $shoppingExpanded) {
                NavigationLink(destination: Shopping1()) {
                    Label("Budget shopping", systemImage: "dollarsign")
                }
                NavigationLink(destination: Shopping2()) {
                    Label("Ballers only", systemImage: "banknote")
                }
            }
            DisclosureGroup("fun", isExpanded: $funExpanded) {
                NavigationLink(destination: MainOptions()) {
                    Label("click for fun", systemImage: "gearshape")
                }
            }
        }
        .listStyle(SidebarListStyle())
    }
}

#Preview {
    SwiftUIView()
}
