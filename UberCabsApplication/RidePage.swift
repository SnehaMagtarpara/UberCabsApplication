//
//  RidePage.swift
//  UberCabsApplication
//
//  Created by R93 on 08/08/23.
//



import UIKit
import MapKit
import CoreLocation

class RidePage: UIViewController, MKMapViewDelegate {

    let locationManager = CLLocationManager()
    let mapView = MKMapView()

    @IBOutlet weak var mappView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.delegate = self
//        locationManager.startUpdatingLocation()
//        mapView.frame = view.bounds
//        mapView.autoresizingMask = [.flexibleWidth,.flexibleHeight]


        mappView.showsUserLocation = true
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

extension RidePage:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if let locations = locations.first{
            print("location:: (location)")
            let span = MKCoordinateSpan()

            let region = MKCoordinateRegion(center: locations.coordinate, span: span)
            mappView.setRegion(region, animated: true)

        }
    }
}

extension ViewController : MKMapViewDelegate {
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView?{
        if annotation is MKUserLocation {
            return nil
        }
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKMarkerAnnotationView
        pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//        pinView?.pinTintColor = UIColor.orange
        pinView?.canShowCallout = true
        let smallSquare = CGSize(width: 30, height: 30)
        let button = UIButton(frame: CGRect(origin: CGPointZero, size: smallSquare))
        button.setBackgroundImage(UIImage(named: "car"), for: .disabled)
        button.addTarget(self, action: "getDirections", for: .touchUpInside)
        pinView?.leftCalloutAccessoryView = button
        return pinView

    }
}
