//
//  DeliveryManPickerController.swift
//  Yo!Food
//
//  Created by Yamadou Traore on 7/19/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import GoogleMaps

class DeliveryManPickerController: UIViewController, GMSMapViewDelegate {

    // MARK : Properties
    @IBOutlet weak var mapView: GMSMapView!
    let initialCameraPosition = CLLocation(latitude: 14.746913609477028, longitude: -17.462822377834527)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        let position = CLLocationCoordinate2DMake(14.746913609477028, -17.462822377834527)
        mapView.camera = GMSCameraPosition(target: initialCameraPosition.coordinate, zoom: 12, bearing: 0, viewingAngle: 0)
        let marker = GMSMarker(position: position)
        marker.map = mapView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func yadayada(alert: UIAlertAction!) {
        print("Hello World")
        let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "OrderSummary")
        self.navigationController?.pushViewController(vc, animated:true)
        print("Success")
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
      
        let alertController = UIAlertController(
            title: "Lamine Dieng",
            message: "Age: 24\n Vehicule: Velo",
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
            handler: yadayada
            
        )
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        return true
    }
    
}

//14.7303591624653  -17.469842210412
// 14.7115787049203 -17.4459571391344
//14.7242756983758  -17.4888040870428
//14.6803627854525  -17.4654661864042
//14.7399258209224  -17.4222001433372
