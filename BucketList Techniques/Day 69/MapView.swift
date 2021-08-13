// MapView.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/integrating-mapkit-with-swiftui
// https://www.hackingwithswift.com/books/ios-swiftui/communicating-with-a-mapkit-coordinator
/**
 `OVERVIEW` :
 `STEP 1` : Create a nested class that inherits from NSObject .
 `STEP 2` : Make it conform to whatever delegate protocol our view or view controller works with .
 `STEP 3` : Give it a reference to the parent struct so it can pass data back up to SwiftUI .
 */

// MARK: - LIBRARIES -

import SwiftUI
import MapKit



struct MapView: UIViewRepresentable {
   
   // MARK: - NESTED TYPES
   
   class Coordinator: NSObject,
                      MKMapViewDelegate {
      
      // MARK: PROPERTIES
      
      var parent: MapView
      
      
      
      // MARK: INITIALIZER METHODS
      
      init(_ parent: MapView) { self.parent = parent }
      
      
      
      // MARK: METHODS
      
      func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
         
         print(mapView.centerCoordinate)
      }
      
      
      /// Customizes the way the annotation marker looks on the map :
      func mapView(_ mapView: MKMapView,
                   viewFor annotation: MKAnnotation)
      -> MKAnnotationView? {
         
          let view = MKPinAnnotationView(annotation: annotation,
                                         reuseIdentifier: nil)
          view.canShowCallout = true
         
          return view
      }
   }
   
   
   
   // MARK: - METHODS
   
   // typeAlias Context = UIViewRepresentableContext<Self>
   /// COMMAND+Click on Context to see its definition .
   func makeUIView(context: Context)
   -> some MKMapView {
      
      let mapView: MKMapView = MKMapView()
      /// ... 2️⃣ We can now connect that to our `MKMapView`:
      mapView.delegate = context.coordinator
      
      let annotation = MKPointAnnotation()
      annotation.title = "London"
      annotation.subtitle = "Capital of England"
      annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5,
                                                     longitude: 0.13)
      mapView.addAnnotation(annotation)
      
      return mapView
   }
   
   
   func updateUIView(_ uiView: UIViewType,
                     context: Context) {}
   
   
   func makeCoordinator()
   -> Coordinator {
      
      return Coordinator(self)
      ///  The `MapView` struct will send itself to the Coordinator
      ///  so it can report back what is happening ... 1️⃣
   }
}
