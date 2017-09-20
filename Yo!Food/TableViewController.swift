//
//  TableViewController.swift
//  Yo!Food
//
//  Created by Yamadou Traore on 8/3/17.
//  Copyright © 2017 com.example. All rights reserved.
//


import UIKit
import RealmSwift

class OrderHistoryController: UITableViewController {
    
    // MARK: Properties
    let realm = try! Realm()
    var orders: Results<CustomerOrderModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orders = realm.objects(CustomerOrderModel.self)
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
        return orders!.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderViewIdentifier", for: indexPath)
        
        // Configure the cell...
        var orderDetail = "\(orders![indexPath.row].quantity) - \(orders![indexPath.row].meal)"
        cell.textLabel?.text = orderDetail
        return cell
    }
    
    
    
}
