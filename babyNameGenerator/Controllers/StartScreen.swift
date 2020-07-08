//
//  ViewController.swift
//  babyNameGenerator
//
//  Created by James Jensen on 10/3/17.
//  Copyright © 2017 James Jensen. All rights reserved.
//

import UIKit
import CoreData

class StartScreen: UIViewController {
    
    var listOfYears = ["1880", "1881", "1882", "1883"]
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var itemArray = [Name]()

    
    
    @IBAction func boyButtonPress(_ sender: Any) {
        boyNameList.shuffle()
        
    }
    
    @IBAction func girlButtonPress(_ sender: Any) {
        girlNameList.shuffle()
    }
    @IBOutlet weak var boyButton: UIButton!
    @IBOutlet weak var girlButton: UIButton!
    @IBOutlet weak var dateFieldPicker: UITextField!
    
    @IBOutlet weak var showFavoritesLook: UIBarButtonItem!
    
    @IBAction func showFavorites(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        
        boyButton.layer.cornerRadius = 20
        boyButton.clipsToBounds = true
        girlButton.layer.cornerRadius = 20
        girlButton.clipsToBounds = true
        navigationItem.title = "Baby Name Generator"
        
    }
    
//    MARK: - CoreData Start Screen
    
    func loadItems() {
        let request: NSFetchRequest<Name> = Name.fetchRequest()
        
        do {
        itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
            
        }

    }
    
}

