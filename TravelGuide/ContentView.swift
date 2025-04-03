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
    @State var userName : String = ""
    @State var password : String = ""
    var body: some View {
        NavigationView{
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
                .frame(width: UIScreen.main.bounds.width * 3, height: 400)
                .offset(y: -250)
                
                VStack {
                    Text("Log in")
                        .font(.largeTitle)
                    InputFieldView(data: $userName, title: "Username:")
                    InputFieldView(data: $password, title: "Password")
                }
                .offset(y: -200)
                
                if(userName == "Hello" && password == "Password") {
                    NavigationLink(destination: FirstView().edgesIgnoringSafeArea(.all)) {
                        Text("Click here for directions to Benihana")
                            .fontWeight(.heavy)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                    }
                    .offset(y: -100)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
