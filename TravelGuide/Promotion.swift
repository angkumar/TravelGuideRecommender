import SwiftUI

struct PromoSliderView: View {
    @State private var home = false
    @State private var eat = false
    @State private var shopping = false
    @State private var shoppingA = false
    @State private var school = false
    private let promotions: [Promotion] = [
        Promotion(imageName: "Food2", title: "Olive Garden", subtitle: "Novi's Favorite Italian Restaurant", buttonText: "View Now"),
        Promotion(imageName: "wm", title: "Shopping", subtitle: "Novi is home to multiple shopping malls", buttonText: "Go Now"),
        Promotion(imageName: "tom", title: "The Rich Only", subtitle: "The biggest shopping mall in the state", buttonText: "Discover More"),
        Promotion(imageName: "school1", title: "The Students Only", subtitle: "The best school in the region", buttonText: "Enroll Now")
    ]
    
    var body: some View {
        NavigationStack {
            TabView {
                ForEach(promotions) { promo in
                    ZStack {
                        Image(promo.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .overlay(Color.black.opacity(0.3))
                            .clipped()
                        
                        VStack {
                            Spacer()
                            VStack(alignment: .center, spacing: 8) {
                                Text(promo.title)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                
                                Text(promo.subtitle)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                Button(action: { handleButtonTap(for: promo) }) {
                                    Text(promo.buttonText)
                                        .fontWeight(.bold)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.white)
                                        .foregroundColor(.black)
                                        .cornerRadius(8)
                                }
                                .padding(.horizontal)
                            }
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(12)
                            .padding()
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .navigationDestination(isPresented: $eat) {
                FoodOG()
            }
            .navigationDestination(isPresented: $shopping) {
                Shopping1()
            }
            .navigationDestination(isPresented: $shoppingA) {
                Shopping2()
            }
        }
    }
    
    /// **Helper Function** to handle button tap logic
    private func handleButtonTap(for promo: Promotion) {
        if promo.buttonText == "View Now" {
            eat = true
        } else if promo.buttonText == "Shop Now" {
            shopping = true
        } else if promo.buttonText == "Discover More"{
            shoppingA = true
        } else {
            school = true
        }
    }
}

struct Promotion: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
    let buttonText: String
}
