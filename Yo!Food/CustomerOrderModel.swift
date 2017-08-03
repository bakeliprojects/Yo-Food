//
//  CustomerOrderModel.swift
//  Yo!Food
//
//  Created by Yamadou Traore on 7/20/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import RealmSwift
import GoogleMaps


class CustomerOrderModel: Object {
    dynamic var meal = ""
    dynamic var quantity = 0
    dynamic var phoneNumber = 0
    dynamic var deliveryMan: DeliveryManModel?
    dynamic var deliveryAdress = ""
    
}
