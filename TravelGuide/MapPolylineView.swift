import SwiftUI
import MapKit

struct MapPolylineView: UIViewRepresentable {
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapPolylineView
        
        init(parent: MapPolylineView) {
            self.parent = parent
        }
        
        //BAHAHAHAHA - Navya
        
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
        let endCoordinate = CLLocationCoordinate2D(latitude: 42.48180223947649, longitude: -83.47077933339779) // Walmart
        let endCoordinate2 = CLLocationCoordinate2D(latitude: 42.489293731285684, longitude: -83.50238818400035)
        
        // Add markers (annotations)
        let locations = [
            ("Olive Garden", CLLocationCoordinate2D(latitude: 42.4851700905243, longitude: -83.4741130123747)),
            ("Home", startCoordinate),
            ("Walmart", endCoordinate),
            ("Twelve Oaks Mall", CLLocationCoordinate2D(latitude: 42.49188857396703, longitude: -83.47064573617806)),
            ("Suburban Collection Showplace", endCoordinate2)
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
        
        let request1 = MKDirections.Request()
        request1.source = MKMapItem(placemark: MKPlacemark(coordinate: startCoordinate))
        request1.destination = MKMapItem(placemark: MKPlacemark(coordinate: endCoordinate2))
        request1.transportType = .automobile
        
        let directions1 = MKDirections(request: request1)
        directions1.calculate { response1, error in
            if let route1 = response1?.routes.first {
                mapView.addOverlay(route1.polyline)
                
                mapView.setVisibleMapRect(route1.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), animated: true)
            }
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {}
}

struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
