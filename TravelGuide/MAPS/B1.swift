//
//  B1.swift
//  TravelGuide
//
//  Created by Angad Kumar on 4/2/25.
//

import SwiftUI
import MapKit

struct B1: UIViewRepresentable {
    @ObservedObject var locationManager: LocationManager
    @State private var hasRouteDrawn = false  // Track if route is drawn

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: B1
        
        init(parent: B1) {
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
        mapView.userTrackingMode = .follow
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        guard locationManager.latitude != 0.0, locationManager.longitude != 0.0 else {
            print("Waiting for valid user location...")
            return
        }
        
        let startCoordinate = CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude)
        let endCoordinate = CLLocationCoordinate2D(latitude: 42.44340310410907, longitude: -83.43302752417712) // Destination
        
        let region = MKCoordinateRegion(center: startCoordinate, latitudinalMeters: 125, longitudinalMeters: 125)
                mapView.setRegion(region, animated: true)
        
        // Prevent redundant redraws
        if hasRouteDrawn { return }
        
        // Remove old overlays and annotations
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)
        
        // Add new markers (annotations)
        let locations = [
            ("WalMart", endCoordinate),
            ("Home", startCoordinate),
        ]
        
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.1
            annotation.title = location.0
            mapView.addAnnotation(annotation)
        }
        
        // Request and draw route
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: startCoordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: endCoordinate))
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let route = response?.routes.first else {
                print("Error calculating route: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            mapView.addOverlay(route.polyline)
            hasRouteDrawn = true // Mark route as drawn
            
            // Adjust map region to fit the route
            mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), animated: true)
        }
    }
}

