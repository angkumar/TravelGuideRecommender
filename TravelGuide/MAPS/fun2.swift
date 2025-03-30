//
//  fun2.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/27/25.
//

import SwiftUI
import MapKit

struct fun2: UIViewRepresentable {
    @ObservedObject var locationManager: LocationManager  // Use an external instance
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: fun2
        
        init(parent: fun2) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = UIColor.red
                renderer.lineWidth = 5
                return renderer
            }
            return MKOverlayRenderer()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        // Ensure we have valid user location
        guard locationManager.latitude != 0.0, locationManager.longitude != 0.0 else {
            print("Waiting for valid user location...")
            return
        }
        
        let startCoordinate = CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude)
        let endCoordinate = CLLocationCoordinate2D(latitude: 40.74844079761186, longitude: -73.98569849282397) // Destination
        
        // Remove old overlays and annotations
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)
        
        // Add new markers (annotations)
        let locations = [
            ("Empire State Building", endCoordinate),
            ("Home", startCoordinate),
        ]
        
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.1
            annotation.title = location.0
            mapView.addAnnotation(annotation)
        }
        
        // Request route only if valid
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: startCoordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: endCoordinate))
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let route = response?.routes.first else {
                print("Error calculating route: \(error?.localizedDescription))")
                return
            }
            
            mapView.addOverlay(route.polyline)
            
            // Adjust map region to fit the route
            mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), animated: true)
        }
    }
}

#Preview {
    fun2(locationManager:   LocationManager())
}
