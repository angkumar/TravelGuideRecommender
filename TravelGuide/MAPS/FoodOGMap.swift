//
//  FoodOGMap.swift
//  TravelGuide
//
//  Created by Angad Kumar on 3/22/25.
//

import SwiftUI
import MapKit

struct FoodOGMap: UIViewRepresentable {
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: FoodOGMap
        
        init(parent: FoodOGMap) {
            self.parent = parent
        }
        
        // Render polyline for real road route
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
        
        let startCoordinate = CLLocationCoordinate2D(latitude: 42.485984063745754, longitude: -83.53735398714915) // Home
        let endCoordinate = CLLocationCoordinate2D(latitude: 42.4851700905243, longitude: -83.4741130123747) // Walmart
        
        // Add markers (annotations)
        let locations = [
            ("Olive Garden", endCoordinate),
            ("Home", startCoordinate),
        ]
        
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.1
            annotation.title = location.0
            mapView.addAnnotation(annotation)
        }
        
        // Request real road route
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: startCoordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: endCoordinate))
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            if let route = response?.routes.first {
                mapView.addOverlay(route.polyline)
                
                // Adjust map region to fit the route
                mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), animated: true)
            }
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {}

}

#Preview {
    FoodOGMap()
}
