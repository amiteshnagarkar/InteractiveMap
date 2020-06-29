//
//  MapView.swift
//  InteractiveMap
//
//  Created by Amitesh Nagarkar on 28/06/2020.
//  Copyright © 2020 Amitesh Nagarkar. All rights reserved.
//

import Foundation
import MapKit
import SwiftUI

//STRUCT
struct MapView: UIViewRepresentable {
    
     let map = MKMapView()
    
    //FUNCTION
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
 
 
    //shows oahu on map.
    //FUNCTION
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        
        //in this case map is actually MKMapView()
        //the context is as above
        //the coordinator is the views associated coordinator
        map.delegate = context.coordinator
        
        let mapView = MKMapView()
        
        map.showsUserLocation = true
        
        //let center = CLLocationCoordinate2D(latitude: 21.282778, longitude: -157.829444)
        let oahuCenter = CLLocation(latitude: 21.4765, longitude: -157.9647)
        
        let region = MKCoordinateRegion(
             center: oahuCenter.coordinate,
             latitudinalMeters: 50000,
             longitudinalMeters: 60000)
        //let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        map.region = region
        
        mapView.setCameraBoundary(
        MKMapView.CameraBoundary(coordinateRegion: region),
        animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        
        
        // Show artwork on map
        let artwork = Artwork(
          title: "King David Kalakaua",
          locationName: "Waikiki Gateway Park",
          discipline: "Sculpture",
          coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
        //mapView.addAnnotation(artwork)
        map.addAnnotation(artwork)
        
        
        return map
        
    
    }

    //not in use currently
    //FUNCTION
    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
    }

    //CLASS
    class Coordinator: NSObject, MKMapViewDelegate{
      // 1
        var parent: MapView
        init(_ parent: MapView) {
            self.parent = parent
        }
        
      // delegate method
        // return an instance of MKAnnotationView
        //FUNCTION
      func mapView( _ mapView: MKMapView, viewFor annotation: MKAnnotation ) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? Artwork else {
          return nil
        }
        // 3
        let identifier = "artwork"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
          withIdentifier: identifier) as? MKMarkerAnnotationView {
          dequeuedView.annotation = annotation
          view = dequeuedView
        } else {
          // 5
          view = MKMarkerAnnotationView(
            annotation: annotation,
            reuseIdentifier: identifier)
          view.canShowCallout = true
          view.calloutOffset = CGPoint(x: -5, y: 5)
          view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
      }
        
        //handles call out
        //tell mapkit what to do when the user taps the callout button.
        //FUNCTION
        func mapView( _ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
          
            guard let artwork = view.annotation as? Artwork else {
            return
          }

          let launchOptions = [ MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
          artwork.mapItem?.openInMaps(launchOptions: launchOptions)
        }
        
    }
    
    
    
}








