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

struct MapView: UIViewRepresentable {
    
     let map = MKMapView()
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        
        let mapView = MKMapView()
        
        map.showsUserLocation = true
        
        //let center = CLLocationCoordinate2D(latitude: 21.282778, longitude: -157.829444)
        let oahuCenter = CLLocation(latitude: 21.4765, longitude: -157.9647)
        
        let region = MKCoordinateRegion(
             center: oahuCenter.coordinate,
             latitudinalMeters: 50000,
             longitudinalMeters: 60000)ls
        //let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        map.region = region
        
        mapView.setCameraBoundary(
        MKMapView.CameraBoundary(coordinateRegion: region),
        animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        //return mapView
        
        
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

    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
    }
}
