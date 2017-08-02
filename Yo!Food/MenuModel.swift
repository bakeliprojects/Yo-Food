//
//  MenuModel.swift
//  Yo!Food
//
//  Created by Yamadou Traore on 7/20/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import RealmSwift

class MenuModel: Object {
    dynamic var id = 0
    dynamic var meal = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
