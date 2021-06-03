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
        //Longitude and latitude [41.004844, 28.976239]
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
        //ajouter des annotation
        let annotation = MKPointAnnotation()
        //ajout du titre
        annotation.title = "Sultan Ahmed"
        //ajout du soustitre
        annotation.subtitle = "Turkey Istanbul"
        //ajout de la position
        annotation.coordinate = location
        //ajouter l'annotation a la carte
        MyMap.addAnnotation(annotation)
    }


}

