//
//  MenuModel.swift
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
protocol Meta {
    static func url()->String
}

class MenuModel: Object, Mappable, Meta {
    
    dynamic var id = 0
    dynamic var meal = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //Impl. of Mappable protocol
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        id <- map["id"]
        meal <- map["name"]
    }
    
    //Impl. of Meta protocol
    static func url()->String {
        return "http://192.168.1.33:8000/yofoodapi/public/api/meals"
    }
}
