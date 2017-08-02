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
                    fail(error as NSError)fff
                }
        }
    }
}
