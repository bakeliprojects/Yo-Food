//
//  MenuViewController.swift
//  Yo!Food
//
//  Created by Yamadou Traore on 7/18/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire

class MenuViewController: UITableViewController {

    // Properties
    var menu: Results<MenuModel>?
    //var tempOrder = OrderModel()
    var tempOrder = CustomerOrderModel()
    let realm = try! Realm()
    let deliveryDetailSegueIdentifier = "ShowDeliveryDetailSegue"
    let yoFoodAPImeals = "http://192.168.1.33:8000/yofoodapi/public/api/meals"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(yoFoodAPImeals, method: .get)
            .responseJSON { response in
                
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
                
                for meal in meals {
                    print(meal["name"]!)
                    var newMeal = MenuModel()
                    newMeal.meal = meal["name"] as! String
                    newMeal.id = meal["id"] as! Int
                    
                    try! self.realm.write {
                        self.realm.add(newMeal, update:true)
                    }
                    
                }
                
        }
        
        menu = realm.objects(MenuModel.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menu!.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        // cell configuration
        //let menu = realm.objects(MenuModel.self)
        cell.textLabel?.text = menu?[indexPath.row].meal
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == deliveryDetailSegueIdentifier {
            let destination = segue.destination as! DeliveryDetailController
            let selectedRow = tableView.indexPathForSelectedRow?.row
            tempOrder.meal = (menu?[selectedRow!].meal)!
            destination.tempOrder = tempOrder
            
        }
    }
    
}
