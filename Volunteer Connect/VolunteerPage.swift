//
//  VolunteerPage.swift
//  Volunteer Connect
//
//  Created by Herman Saini on 10/21/17.
//  Copyright © 2017 Herman Saini. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData


class VolunteerPage: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var zoom = true
    @IBOutlet var mapView: MKMapView!
    var locationManager: CLLocationManager!
    lazy var formatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.timeStyle = DateFormatter.Style.short
        formatter.dateStyle = DateFormatter.Style.short
        return formatter
    }()
   
    public var currentLocation: MKUserLocation? {
        didSet {
            //button.isHidden = (currentLocation == nil)
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            switch CLLocationManager.authorizationStatus() {
                
            case .authorizedAlways, .authorizedWhenInUse:
                locationManager.startUpdatingLocation()
                mapView.showsUserLocation = true
                
            default:
                locationManager.requestWhenInUseAuthorization()
            }
        }
        
    }
    
    @IBAction func addAnEvent(_ sender: UIButton) {
        guard let coordinate = currentLocation?.coordinate else {
            return
        }
        
        let reportTime = Date()
        let formattedTime = formatter.string(from: reportTime)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Volunteer w/ Apple"
        annotation.subtitle = formattedTime
        annotation.coordinate = coordinate
        
        mapView.addAnnotation(annotation)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {

        performSegue(withIdentifier: "eventTransition", sender: self)

    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
            
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager?.startUpdatingLocation()
            mapView.showsUserLocation = true
            
        case .denied, .restricted:
            locationManager?.startUpdatingLocation()
            mapView.showsUserLocation = false
            currentLocation = nil
            
        default:
            currentLocation = nil
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        if(zoom == true){
            let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude);
            
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            zoom = false;
            
            mapView.setRegion(region, animated: true)
            
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        currentLocation = userLocation
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !annotation.isKind(of: MKUserLocation.self) else {
            
            return nil
        }
        
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
        annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        annotationView!.canShowCallout = true
        
        annotationView!.image = UIImage(named: "smile")
        
        return annotationView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mapView.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
