// MapView.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/integrating-mapkit-with-swiftui

// MARK: - LIBRARIES -

import SwiftUI
import MapKit



struct MapView: UIViewRepresentable {
   
   // typeAlias Context = UIViewRepresentableContext<Self>
   
   func makeUIView(context: Context)
   -> some MKMapView {
      
      let mapView: MKMapView = MKMapView()
      return mapView
   }
   
   
   func updateUIView(_ uiView: UIViewType,
                     context: Context) {}
}
