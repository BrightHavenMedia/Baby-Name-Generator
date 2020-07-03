//
//  GirlScreen.swift
//  babyNameGenerator
//
//  Created by James Jensen on 10/6/17.
//  Copyright © 2017 James Jensen. All rights reserved.
// when I press boy or girl it shuffles the array. When I click generate it ittereates through that array. Find a way to make each name display once. 

import Foundation
import UIKit
import CoreData

class GirlScreen: UIViewController {
    
    var itemArray = [Name]()
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var girlFavoriteName : String = ""
    
    var currentElement = 0
    
    @IBOutlet weak var girlNameLabel: UILabel!
    
    @IBOutlet weak var girlGenerate: UIButton!
    
    @IBOutlet weak var girlAddStyling: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        girlNameLabel.isEnabled = false
        girlAddStyling.isHidden = true
        
        girlNameLabel.layer.cornerRadius = 10
        girlNameLabel.clipsToBounds = true
        girlGenerate.layer.cornerRadius = 20
        girlGenerate.clipsToBounds = true
    
    }
    
    @IBAction func girlAddFavorite(_ sender: UIButton) {

        sender.isSelected = false
        sender.isEnabled = true
        let newName = Name(context: self.context)
        newName.babyName = girlNameLabel.text!
        
        if sender.isSelected {
            
            self.itemArray.append(newName)
            
        }else {
            sender.isEnabled = false
        }
        saveItems()
    }
    

    @IBAction func girlGeneratePress(_ sender: Any) {
        
        girlNameLabel.isEnabled = true
        girlAddStyling.isEnabled = true
        girlAddStyling.isSelected = false
        girlAddStyling.isHidden = false
        
        if currentElement < girlNameList.count {
            girlNameLabel.text = girlNameList[currentElement]
            
            currentElement += 1
            
        } else {
            girlNameLabel.text = "Sorry Out of Names"
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
