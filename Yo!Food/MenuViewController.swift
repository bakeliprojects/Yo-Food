//
//  MenuViewController.swift
//  Yo!Food
//
//  Created by Yamadou Traore on 7/18/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import RealmSwift

class MenuViewController: UITableViewController {

    // Properties
    var menu: Results<MenuModel>?
    //var tempOrder = OrderModel()
    var tempOrder = CustomerOrderModel()
    let realm = try! Realm()
    let deliveryDetailSegueIdentifier = "ShowDeliveryDetailSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == deliveryDetailSegueIdentifier {
            let destination = segue.destination as! DeliveryDetailController
            let selectedRow = tableView.indexPathForSelectedRow?.row
            tempOrder.meal = (menu?[selectedRow!].meal)!
            destination.tempOrder = tempOrder
            
        }
    }
    
}
