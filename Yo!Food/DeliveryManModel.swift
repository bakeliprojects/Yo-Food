//
//  DeliveryManModel.swift
//  Yo!Food
//
//  Created by Yamadou Traore on 7/20/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import AlamofireObjectMapper

// All Realm object models have to follow the Meta protocol to provide the URL

class DeliveryManModel: Object, Mappable, Meta {
    
    dynamic var id = 0
    dynamic var name = ""
    dynamic var age = 0
    dynamic var latitude = 0.0
    dynamic var longitude = 0.0
    dynamic var typeOfVehicle = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //Impl. of Mappable protocol
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        age <- map["age"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        typeOfVehicle <- map["vehicle"]
    }
    
    //Impl. of Meta protocol
    static func url()->String {
        return "http://192.168.1.33:8000/yofoodapi/public/api/delivery_men"
    }
    
}
