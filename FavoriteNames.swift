//
//  FavoriteNames.swift
//  babyNameGenerator
//
//  Created by James Jensen on 5/22/20.
//  Copyright © 2020 James Jensen. All rights reserved.
//

import Foundation
import UIKit


class FavoriteNames: UITableViewController {
    
    let itemArray = ["Mike", "Jane", "Henry"]
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BabyNameCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
//MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
//        add checkmark next to table cells Leaving this in because I might want to rank names etc.
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    
    
    
   
    
    

    
    
}


