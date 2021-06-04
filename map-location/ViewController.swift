//
//  ViewController.swift
//  map-location
//
//  Created by Mehdi Benrefad on 03/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate{
    @IBOutlet weak var MyMap: MKMapView!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabe: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var latitude : CLLocationDegrees = 38.897957
    var longitude : CLLocationDegrees = -77.036560
    
    //get the user location
    var location = ""
    var subtitlelocation = ""
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make the view controller as a delegate of the location manager
        locationManager.delegate = self as CLLocationManagerDelegate
        //precision
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //authorisation
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        
        /*
            Debut du tracage
         */
        //Longitude et latitude [41.004844, 28.976239]
        //usa
        //let latitude : CLLocationDegrees = 38.897957
        //let longitude : CLLocationDegrees = -77.036560
        //turkey
        //let latitude : CLLocationDegrees = 41.004844
        //let longitude : CLLocationDegrees = 28.976239
        //tracePositionInTheMap ()
        
    }

    
    //recuperer la localisation de l'utilisateur et l'affichage de cette derniere dans la carte
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        print(locations)
        let userLocalisation:CLLocation = locations[0]
        latitude = userLocalisation.coordinate.latitude
        longitude = userLocalisation.coordinate.longitude
        //tracePositionInTheMap()
        
        //get date from user location
        getDataFromLocation(userLocalisation)
        
        //remplir les labels
        putDataOnTheLabels()
    }
    
    
    //fonction qui s'occupe des markers
    @objc func longPress(gestureRecognizer: UIGestureRecognizer){
             let touchPoint = gestureRecognizer.location(in: MyMap)
             let coordinate = MyMap.convert(touchPoint, toCoordinateFrom: MyMap)
              let annotation = MKPointAnnotation()
             annotation.coordinate = coordinate
              annotation.title = "static mark"
              annotation.subtitle = "static"
              MyMap.addAnnotation(annotation)
         }
    
    
    
    //fonction qui permet de trace la position dans la carte
    func tracePositionInTheMap (){
        //Ajouter des annotation
        let annotation = MKPointAnnotation()
        //Ajout du titre
        annotation.title = self.location
        //Ajout du soustitre
        annotation.subtitle = self.subtitlelocation
        //Ajout de la position
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        MyMap.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        //ajouter la region a la carte
        MyMap.setRegion(region, animated: true)
        
        //Ajout des Markers [quand on presse lontement su une position de l'ecran une nouvelle annotation s'ajoutes]
         let mylongpress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gestureRecognizer:)))
        //definition de la duree du clic enfonce
        mylongpress.minimumPressDuration = 2
        MyMap.addGestureRecognizer(mylongpress)
    }
    
    
    //recuperer les donnees a partir de l localisation
    func getDataFromLocation(_ userLocation:CLLocation){
        
            CLGeocoder().reverseGeocodeLocation(userLocation ){
                   (placemarks,error) in
                   if error != nil {
                       print(error!)
                   }else{
                       if let placemark = placemarks?[0]{
                           var mythoroughfare = ""
                           if placemark.thoroughfare != nil {
                               mythoroughfare =  placemark.thoroughfare!
                           }
                           
                           var subLocality = ""
                           if placemark.subLocality != nil {
                                  subLocality =  placemark.thoroughfare!
                                              }
                           
                           var subAdministrativeArea = ""
                           if placemark.subAdministrativeArea != nil {
                            subAdministrativeArea =  placemark.subAdministrativeArea!
                                                             }
                           var postalCode = ""
                                          if placemark.postalCode != nil {
                               postalCode =  placemark.postalCode!
                                                                            }
                           let country = ""
                                    if placemark.country != nil {
                                   postalCode =  placemark.country!
                                                         }
                           
                        print( mythoroughfare + " \n" + subLocality + "  \n" + subAdministrativeArea + "  \n" + postalCode + "  \n" + country )
                           
                        //put location on the global variable
                        self.location = subLocality
                        self.subtitlelocation = subAdministrativeArea
                        
                        //put country and location in labels
                        self.locationLabel.text = subLocality
                        self.countryLabel.text = subAdministrativeArea + " / " + postalCode
                        
                        self.tracePositionInTheMap()
                       }
                   }
               }
    }
    
    func putDataOnTheLabels(){
        latitudeLabel.text = String(latitude)
        longitudeLabe.text = String(longitude)
        //locationLabel.text = subLocality [go to getDataFromLocation()]
        //countryLabel.text = country [go to getDataFromLocation()]
        
    }
}

