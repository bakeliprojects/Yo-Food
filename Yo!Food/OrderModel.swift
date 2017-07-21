//
//  OrderModel.swift
//  Yo!Food
//
//  Created by Yamadou Traore on 7/19/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import Foundation
import GoogleMaps

class OrderModel {
    
    // MARK: Properties
    // order_id
    var mealName: String
    var numberOfPlates: Int
    var phoneNumber: Int
    var deliveryMan = DeliveryManModel()
    var deliveryAdress: GMSMarker
    
    init() {
        mealName = String()
        numberOfPlates = Int()
        phoneNumber = Int()
        deliveryAdress = GMSMarker()
    }
    
    
    func getMealName() ->String { return mealName }
    func getNumberOfPlates() ->Int{ return numberOfPlates }
    func getPhoneNumber() ->Int{ return
        phoneNumber }
    func getDeliveryAdress() ->GMSMarker { return deliveryAdress }
    
    func setMealName(name: String) { mealName = name}
    func setNumberOfPlates(num: Int) { numberOfPlates = num}
    func setPhoneNumber(phone: Int) { phoneNumber = phone}
    func setDeliveryAdress(addres: GMSMarker) {deliveryAdress = addres}
    
    
}
