//
//  SidebarView.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/23/25.
//


import SwiftUI

struct SidebarView: View {
        @State private var homeExpanded = false
        @State private var profileExpanded = false
        @State private var settingsExpanded = false
        
        var body: some View {
            List {
                
                Text("Options")
                    .font(.largeTitle)
                
                DisclosureGroup("Home", isExpanded: $homeExpanded) {
                    NavigationLink(destination: MainScreen()) {
                        Label("Dashboard", systemImage: "house.fill")
                    }
                    NavigationLink(destination: Text("Activity")) {
                        Label("Activity", systemImage: "list.bullet")
                    }
                }
                
                DisclosureGroup("Profile", isExpanded: $profileExpanded) {
                    NavigationLink(destination: Profile()) {
                        Label("View Profile", systemImage: "person.crop.circle")
                    }
                    NavigationLink(destination: Profile()) {
                        Label("Edit Profile", systemImage: "pencil")
                    }
                }
                
                DisclosureGroup("Settings", isExpanded: $settingsExpanded) {
                    NavigationLink(destination: MainOptions()) {
                        Label("General", systemImage: "gearshape")
                    }
                    NavigationLink(destination: MainOptions()) {
                        Label("Privacy", systemImage: "lock.shield")
                    }
                }
            }
            .listStyle(SidebarListStyle())
        }
}

