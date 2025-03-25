//
//  LocationManager.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/25/25.
//


import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    @Published var latitude: Double? = nil
    @Published var longitude: Double? = nil
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            DispatchQueue.main.async {
                self.latitude = location.coordinate.latitude
                self.longitude = location.coordinate.longitude
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            DispatchQueue.main.async {
                self.authorizationStatus = status
                if status == .authorizedWhenInUse || status == .authorizedAlways {
                    self.locationManager.startUpdatingLocation()
                } else {
                    self.latitude = nil
                    self.longitude = nil
                }
            }
        }
}
