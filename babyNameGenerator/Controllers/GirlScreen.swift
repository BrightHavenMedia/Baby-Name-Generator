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

class GirlScreen: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var itemArray = [Name]()
    var listOfYears = ["1900", "1901", "1902"]
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var girlFavoriteName : String = ""
    
    var currentElement = 0
    
    @IBOutlet weak var girlYearPicker: UITextField!
    
    @IBOutlet weak var girlNameLabel: UILabel!
    
    @IBOutlet weak var girlGenerate: UIButton!
    
    @IBOutlet weak var girlAddStyling: UIButton!
    
// MARK: - View Did Load and Label Formatting
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePicker = UIPickerView()
        
        girlYearPicker.inputView = datePicker
        datePicker.delegate = self
        
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GirlScreen.dismissKeyboard))
        
        view.addGestureRecognizer(tapGestureRecognizer)
        
        addDoneButtonOnKeyboard()
    
        girlNameLabel.isEnabled = false
        girlAddStyling.isHidden = true
        
        girlYearPicker.layer.cornerRadius = 10
        girlYearPicker.clipsToBounds = true
            
        girlNameLabel.layer.cornerRadius = 10
        girlNameLabel.clipsToBounds = true
        girlGenerate.layer.cornerRadius = 20
        girlGenerate.clipsToBounds = true
    
    }
    
// MARK: - Favorite Button and Favorite List
    
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
    
// MARK: - Generate Names
    

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
        girlYearPicker.text = listOfYears[row]
        girlYearPicker.textColor = UIColor.black
        girlYearPicker.font = UIFont.boldSystemFont(ofSize: 18)
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
        
        girlYearPicker.inputAccessoryView = doneToolbar
        
    }
    
    @objc func doneButtonAction(){
        girlYearPicker.resignFirstResponder()
    
    }

//    MARK: - Core Data
    
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
