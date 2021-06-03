//
//  ViewController.swift
//  map-location
//
//  Created by Mehdi Benrefad on 03/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var MyMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Longitude et latitude [41.004844, 28.976239]
        let latitude : CLLocationDegrees = 28.976239
        let longitude : CLLocationDegrees = 41.004844
        
        //la distance entre les points de tracage
        let latDelta : CLLocationDegrees = 0.05
        let longitudeDelta : CLLocationDegrees = 0.05
        //portee des coordonnees elle assemble "latDelta" et "longitudeDelta" pour tracer le plan de localisation
        let span : MKCoordinateSpan = MKCoordinateSpan( latitudeDelta: latDelta, longitudeDelta: longitudeDelta )
        //definir la location a partir de la longitude et la latitude
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        //definir la region de la localisation
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        //ajouter la region a la carte
        MyMap.setRegion(region, animated: true)
        
        //Ajouter des annotation
        let annotation = MKPointAnnotation()
        //Ajout du titre
        annotation.title = "Sultan Ahmed"
        //Ajout du soustitre
        annotation.subtitle = "Turkey Istanbul"
        //Ajout de la position
        annotation.coordinate = location
        //Ajouter l'annotation a la carte
        MyMap.addAnnotation(annotation)
        
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

