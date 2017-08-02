//
//  FetchData.swift
//  Yo!Food
//
//  Created by Yamadou Traore on 8/2/17.
//  Copyright © 2017 com.example. All rights reserved.
//


import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift

// This GET request can only create new or update existing items in the Realm database

class FetchData {
    static func get <T: Object> (type: T.Type, success:@escaping () -> Void, fail:@escaping (_ error:NSError)->Void)->Void where T:Mappable, T:Meta {
        
        Alamofire.request(type.url(), method: .get)
            .responseArray { (response: DataResponse<[T]>) in
                switch response.result {
                case .success(let items):
                    print("Waganor")
                    autoreleasepool {
                        do {
                            let realm = try Realm()
                            try realm.write {
                                for item in items {
                                    realm.add(item, update: true)
                                }
                            }
                        } catch let error as NSError {
                            fail(error)
                        }
                    }
                    success()
                case .failure(let error):
                    print("Yamadooor")
                    fail(error as NSError)
                }
        }
    }
}


/*
 guard response.result.error == nil else {
 // got an error in getting the data, need to handle it
 print("error calling GET on /todos/1")
 print(response.result.error!)
 return
 }
 
 // make sure we got some JSON since that's what we expect
 guard let json = response.result.value as? [String: Any] else {
 print("didn't get todo object as JSON from API")
 print("Error: \(String(describing: response.result.error))")
 return
 }
 
 
 guard let meals = json["data"] as? [[String: Any]] else {
 print("could not convert data to array")
 return
 }
 
 
 try! self.realm.write {
 
 for meal in meals {
 var newMeal = MenuModel()
 newMeal.meal = meal["name"] as! String
 newMeal.id = meal["id"] as! Int
 self.realm.add(newMeal, update: true)
 }
 
 }*/
