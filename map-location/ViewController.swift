//
//  ViewController.swift
//  map-location
//
//  Created by Mehdi Benrefad on 03/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , MKMapViewDelegate{
    @IBOutlet weak var MyMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Longitude et latitude [41.004844, 28.976239]
        //usa
        let latitude : CLLocationDegrees = 38.897957
        let longitude : CLLocationDegrees = -77.036560
        //turkey
        //let latitude : CLLocationDegrees = 41.004844
        //let longitude : CLLocationDegrees = 28.976239
        
        //Ajouter des annotation
        let annotation = MKPointAnnotation()
        //Ajout du titre
        annotation.title = "The white house"
        //Ajout du soustitre
        annotation.subtitle = "USA"
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

  @objc func longPress(gestureRecognizer: UIGestureRecognizer){
           let touchPoint = gestureRecognizer.location(in: MyMap)
           let coordinate = MyMap.convert(touchPoint, toCoordinateFrom: MyMap)
            let annotation = MKPointAnnotation()
           annotation.coordinate = coordinate
            annotation.title = "static mark"
            annotation.subtitle = "static"
            MyMap.addAnnotation(annotation)
       }

     
}

