//
//  OrderSummaryController.swift
//  Yo!Food
//
//  Created by Yamadou Traore on 7/19/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import GoogleMaps
import RealmSwift

class OrderSummaryController: UIViewController {

    // MARK: Properties
    let realm = try! Realm()
    var deliveryAdress = GMSMarker()
    var tempOrder = CustomerOrderModel()
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var numPlatesLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var deliveryManlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealNameLabel.text = tempOrder.meal
        numPlatesLabel.text = String(tempOrder.quantity)
        phoneNumberLabel.text = String(tempOrder.phoneNumber)
        deliveryManlabel.text = tempOrder.deliveryMan?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitOrder(_ sender: Any) {
        
        try! realm.write {
            realm.add(tempOrder)
        }
        
        let alertController = UIAlertController(
            title: "Order Succesfully placed",
            message: "Now Sit Back & Relax",
            preferredStyle: .alert
        )

        let confirmAction = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: { _in in self.performSegue(withIdentifier: "BackToMenuSegue", sender: self)}
        )
        
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func cancelOrder(_ sender: Any) {
        let alertController = UIAlertController(
            title: "Are you sure you want to cancel this order?",
            message: "",
            preferredStyle: .alert
        )
        
        let  cancelAction = UIAlertAction(
            title: "Yes",
            style: .default,
            handler: { _in in self.performSegue(withIdentifier: "BackToMenuSegue", sender: self)}
        )
        
        let  undoCancelationAction = UIAlertAction(
            title: "No",
            style: .default,
            handler: nil
        )
        
        alertController.addAction(cancelAction)
        alertController.addAction(undoCancelationAction)
        present(alertController, animated: true, completion: nil)
    }
    
    

}
