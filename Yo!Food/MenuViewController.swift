//
//  MenuViewController.swift
//  Yo!Food
//
//  Created by Yamadou Traore on 7/18/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    // Properties
    let deliveryDetailSegueIdentifier = "ShowDeliveryDetailSegue"
    let meals = ["Yassa", "mafé", "Thiebou Guinar", "Soup Kandja", "Thiebou djeun", "Thiebou Yapp", "Païla", "C'est Bon", "Thiou Curry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return meals.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        // cell configuration
        cell.textLabel?.text = meals[indexPath.row]
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(meals[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == deliveryDetailSegueIdentifier {
            let destination = segue.destination as! DeliveryDetailController
            let selectedRow = tableView.indexPathForSelectedRow?.row
            destination.mealName = meals[selectedRow!]
            
        }
    }
}
