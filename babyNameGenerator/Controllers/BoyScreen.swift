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

class BoyScreen: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var currentElement = 0
    var itemArray = [Name]()
    var listOfYears = ["1900", "1901", "1902"]
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var boyYearPicker: UITextField!
    @IBOutlet weak var boyScreenLabel: UILabel!
    @IBOutlet weak var boyGenerate: UIButton!
    @IBOutlet weak var boyAddStyling: UIButton!
    
// MARK: - View Did Load and Label Formatting
    
   override func viewDidLoad() {
    
    
    super.viewDidLoad()
    boyScreenLabel.isEnabled = false
    boyAddStyling.isHidden = true

    let datePicker = UIPickerView()
    
    boyYearPicker.inputView = datePicker
    datePicker.delegate = self
    
    let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BoyScreen.dismissKeyboard))
    
    view.addGestureRecognizer(tapGestureRecognizer)

    addDoneButtonOnKeyboard()
    
    boyYearPicker.layer.cornerRadius = 10
    boyYearPicker.clipsToBounds = true

    boyScreenLabel.layer.cornerRadius = 10
    boyScreenLabel.clipsToBounds = true
    boyGenerate.layer.cornerRadius = 20
    boyGenerate.clipsToBounds = true
    
   }
// MARK: - Favorite Button and Favorite List
    
    @IBAction func boyAddFavorite(_ sender: UIButton) {
        
//        sender.isSelected.toggle()
        
       sender.isSelected = false
            sender.isEnabled = true
            let newName = Name(context: self.context)
            newName.babyName = boyScreenLabel.text!
            
            if sender.isSelected {
                
                self.itemArray.append(newName)
                
            }else {
                sender.isEnabled = false
            }
            saveItems()
        }
    
    @IBAction func showFavorites(_ sender: Any) {
    }
    
// MARK: - Generate Names
    
    @IBAction func boyGeneratePress(_ sender: Any) {
        
        boyScreenLabel.isEnabled = true
        boyAddStyling.isEnabled = true
        boyAddStyling.isSelected = false
        boyAddStyling.isHidden = false
        
        
        if currentElement < boyNameList.count {
            boyScreenLabel.text = boyNameList[currentElement]
            
            currentElement += 1
            
        } else {
            boyScreenLabel.text = "Sorry Out of Names"
        }
    }
    
//    MARK: - Date Picker
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfYears.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        boyYearPicker.text = listOfYears[row]
        boyYearPicker.textColor = UIColor.black
        boyYearPicker.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listOfYears[row]
    }
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        boyYearPicker.inputAccessoryView = doneToolbar
        
    }
    
    @objc func doneButtonAction(){
        boyYearPicker.resignFirstResponder()
    
    }
    
// MARK: - Core Data
    
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
    
    func deleteItems() {
        
       
        
    }
    
}

    

