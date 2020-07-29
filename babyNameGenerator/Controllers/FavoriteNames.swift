//
//  FavoriteNames.swift
//  babyNameGenerator
//
//  Created by James Jensen on 5/22/20.
//  Copyright © 2020 James Jensen. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FavoriteNames: UITableViewController {
    
    var itemArray = [Name]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    override func viewDidLoad() {
        loadItems()
        self.tableView.backgroundColor = UIColor(red: 252/255.0, green: 251/255.0, blue: 227/255.0, alpha: 1.0)
    }
    
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BabyNameCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.babyName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let name = itemArray[indexPath.row]
            itemArray.remove(at: indexPath.row)
            context.delete(name)
            saveItemsTableSwipe()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    //MARK: - Add Name UIAlert
    
    @IBAction func addNameButton(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Baby Name", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Name", style: .default) { (action) in
            
            let newName = Name(context: self.context)
            
            newName.babyName = textField.text!
            
            self.itemArray.append(newName)
            
            self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Baby Name"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - Core Data Functions
    
    func saveItems() {
        
        do {
            try context.save()
            
        } catch {
            print("Error saving context \(error)")
            
        }
        self.tableView.reloadData()
    }
    
    func saveItemsTableSwipe() {
        
        do {
            try context.save()
            
        } catch {
            print("Error saving context \(error)")
            
        }
        
    }
    
    func loadItems(with request: NSFetchRequest<Name> = Name.fetchRequest()) {
        let request: NSFetchRequest<Name> = Name.fetchRequest()
        
        do {
            itemArray = try context.fetch(request)
            
        } catch {
            print("Error fetching data from context \(error)")
            
        }
    }
    
}




    
    


    
   
    
    

    
    


