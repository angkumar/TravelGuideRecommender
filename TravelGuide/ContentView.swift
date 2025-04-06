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
    @State private var userName : String = ""
    @State private var password : String = ""
    @State private var isLoggedIn: Bool = false
    var body: some View {
        NavigationStack{
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .rotationEffect(Angle(degrees: 15))
                    
                    
                    VStack{
                        Text("Travel Guide")
                            .font(.system(size: 60, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Text("Discover the world")
                            .font(.system(size: 30, weight: .light, design: .default))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 125)
                }
                .frame(width: 750, height: 400)
                .offset(y: -250)
                
                VStack {
                    Text("Log in")
                        .font(.largeTitle)
                    InputFieldView(data: $userName, title: "Username:")
                    SecureFieldView(data: $password, title: "Password")
                }
                .frame(width: 390, height: 180)
                .offset(y: -200)// ✅ Use NavigationStack (iOS 16+)
                            VStack(spacing: 24) {
                                Button {
                                    if userName == "Hello" && password == "Password" {
                                        isLoggedIn = true
                                    }
                                } label: {
                                    Text("Log In")
                                        .fontWeight(.heavy)
                                        .font(.title3)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(40)
                                }
                                .frame(width: 250)
                                .offset(y: -200) // ✅ Your custom offset
                            }
                            // ✅ Navigation trigger using state binding
                            .navigationDestination(isPresented: $isLoggedIn) {
                                FirstView()
                            }
                        }
                    }
                
            }
        }


#Preview {
    ContentView()
}
