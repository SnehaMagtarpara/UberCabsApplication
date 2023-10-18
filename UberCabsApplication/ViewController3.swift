//
//  ViewController3.swift
//  UberCabsApplication
//
//  Created by R93 on 08/08/23.
//

import UIKit
import MapKit
import CoreLocation

class ViewController3: UIViewController,MKMapViewDelegate,UISearchBarDelegate {
    
    @IBOutlet weak var mappView: MKMapView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        mappView.delegate = self
    }
    //MARK = Searchbar
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let query = searchBar.text, !query.isEmpty{
            searchForLocation(query: query)
        }
    }
    
    //MARK = Location Search
    
    func searchForLocation(query:String)
    {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        
        let search = MKLocalSearch(request: request)
        search.start { [weak self] (response, error)  in
            guard let self = self, let response = response
            else{
                return
            }
//            self.mappView.removeAnnotation(self.mappView.annotations as! MKAnnotation)
            self.mappView.removeAnnotations(self.mappView.annotations)
            
            for item in response.mapItems
            {
                let annotation = MKPointAnnotation()
                annotation.title = item.name
                annotation.coordinate = item.placemark.coordinate
                self.mappView.addAnnotation(annotation)
                searchForLocation()
            }
            
            //MARK = Zoom To Map
            func searchForLocation()
            {
                let geocoder = CLGeocoder()
                geocoder.geocodeAddressString(self.searchBar.text ?? "" ){ (placemaek, error) in
                    if let error = error
                    {
                        print("Error:\(error.localizedDescription)")
                        return
                    }
                    if let placemark = placemaek?.first{
                        let region = MKCoordinateRegion(center: placemark.location!
                            .coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
                        self.mappView.setRegion(region, animated: true)
                        self.mappView.reloadInputViews()
                    }
                    
                }
            }
        }
    }
    
    
    
    
}
