//
//  BoyScreen.swift
//  babyNameGenerator
//
//  Created by James Jensen on 10/6/17.
//  Copyright © 2017 James Jensen. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class BoyScreen: UIViewController {
    
    var currentElement = 0
    var itemArray = [Name]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var boyScreenLabel: UILabel!
    @IBOutlet weak var boyGenerate: UIButton!
    @IBOutlet weak var boyAddStyling: UIButton!
    
   override func viewDidLoad() {
       super.viewDidLoad()
       boyScreenLabel.isEnabled = false
       
       if boyScreenLabel.isEnabled == false {
           boyAddStyling.isEnabled = false
           
       }
       boyScreenLabel.layer.cornerRadius = 10
       boyScreenLabel.clipsToBounds = true
       boyGenerate.layer.cornerRadius = 20
       boyGenerate.clipsToBounds = true
    
   }
    
    @IBAction func boyAddFavorite(_ sender: UIButton) {
        
        sender.isSelected.toggle()
        
        let newName = Name(context: self.context)
        newName.babyName = boyScreenLabel.text!
        self.itemArray.append(newName)
        
        self.saveItems()
    
    }
    
    
    @IBAction func showFavorites(_ sender: Any) {
    }
    
    @IBAction func boyGeneratePress(_ sender: Any) {
        
        boyScreenLabel.isEnabled = true
        boyAddStyling.isEnabled = true
        boyAddStyling.isSelected = false
        
        
        if currentElement < boyNameList.count {
            boyScreenLabel.text = boyNameList[currentElement]
            
            currentElement += 1
            
        } else {
            boyScreenLabel.text = "Sorry Out of Names"
        }
    }
    
    
    func saveItems() {
            
        do {
            try context.save()
                
        } catch {
            print("Error saving context \(error)")
                
        }

    }
        
    func loadItems() {
        let request: NSFetchRequest<Name> = Name.fetchRequest()
        
        do {
        itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
            
        }

    }
    
}

    

