//
//  DeliveryManPickerController.swift
//  Yo!Food
//
//  Created by Yamadou Traore on 7/19/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import GoogleMaps
import RealmSwift

class DeliveryManPickerController: UIViewController, GMSMapViewDelegate {

    // MARK : Properties
    let realm = try! Realm()
    var tempOrder = CustomerOrderModel()
    var deliveryAdress = GMSMarker()
    let initialCameraPosition = CLLocation(latitude: 14.746913609477028, longitude: -17.462822377834527)
    
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        // Fetch the data from the API and store them into REALM
        FetchData.get(type: DeliveryManModel.self,
                      success: { print("Success")})
        { (error) in print(error)}
        
        var deliveryMen = self.realm.objects(DeliveryManModel.self)
        mapView.camera = GMSCameraPosition(target: initialCameraPosition.coordinate, zoom: 0, bearing: 0, viewingAngle: 0)
        
        // Create Markers for the delivery men
        for deliveryMan in deliveryMen {
            let position = CLLocationCoordinate2DMake(deliveryMan.latitude, deliveryMan.longitude)
            var marker = GMSMarker()
            marker = GMSMarker(position: position)
            marker.title = deliveryMan.name
            marker.map = mapView
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        var pickedDeliveryMan = realm.objects(DeliveryManModel.self).filter("name == %@", marker.title!).first

        let alertController = UIAlertController(
            title: pickedDeliveryMan?.name,
            message: "Age: \(pickedDeliveryMan!.age) \n Vehicule: \(pickedDeliveryMan!.typeOfVehicle)",
            preferredStyle: .alert
        )
        
        let cancelAction = UIAlertAction(
            title: "Choisir un Autre ",
            style: .default,
            handler: nil
        )
        
        let confirmAction = UIAlertAction(
            title: "Valider",
            style: .default,
            handler:
                 {
                    _in in self.tempOrder.deliveryMan = pickedDeliveryMan!
                    self.performSegue(withIdentifier: "OrderSummarySegue", sender: self)
                  }
        )
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OrderSummarySegue" {
            let destination = segue.destination as! OrderSummaryController
            destination.tempOrder = tempOrder
            destination.deliveryAdress = deliveryAdress
        }
    }

}

