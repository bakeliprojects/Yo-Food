//
//  DeliveryDetailController.swift
//  Yo!Food
//
//  Created by Yamadou Traore on 7/18/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation // provides services for determining a devicee's geographic
                    // location, altitude, orientation ...

class DeliveryDetailController: UIViewController, UITextFieldDelegate, GMSMapViewDelegate{

    // MARK: Properties
    var numPlates = 0
    var phoneNumber = Int()
    var mealName = String()
    var deliveryAdress = GMSMarker()
    let locationManager = CLLocationManager()
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var numPlatesTextfield: UITextField!
    @IBOutlet weak var phoneNumberTextfield: UITextField!
    @IBOutlet weak var mapView: GMSMapView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // request access to user's location
        locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mealNameLabel.text = mealName
    }
    
    // Hide the keyboard when not needed
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Delete any existing marker && add a new one at the new location
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        deliveryAdress.map = nil
        let position = CLLocationCoordinate2DMake((coordinate.latitude), (coordinate.longitude))
        let marker = GMSMarker(position: position)
        marker.isDraggable = true
        marker.map = mapView
        deliveryAdress = marker
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        numPlates = Int(numPlatesTextfield.text!)!
        phoneNumber = Int(phoneNumberTextfield.text!)!
        print(numPlates)
        print(phoneNumber)
    }
    
}


extension DeliveryDetailController: CLLocationManagerDelegate {
    
    
    // MARK: - CLLocationManagerDelegate - REMEMBER TO ASK USER'S AUTHORIZATION
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()     // Ask the location manager for updates on user's location
            mapView.isMyLocationEnabled = true         // draws a light blue dot where the user is located
            mapView.settings.myLocationButton = true  // adds a button to the map that, when tapped, centers the map on user's location
        }
        
    }
    
    
    // Executes when the location manager receives new location data
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            // Upates map's camera to center around user's location
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            
            // Tell locationManager you are no longer interested in updates(following a user around)
            locationManager.stopUpdatingLocation()
            
        }
    }
 
}

/*
 go to the Info tab, select the first line in the Custom iOS Target Properties section and click the + icon to add a new row.
 Enter NSLocationWhenInUseUsageDescription
 
*/



















