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
    var listOfYears = ["2018","2017","2016","2015","2014","2013","2012","2011","2010","2009","2008","2007","2006","2005","2004","2003","2002","2001","2000","1999","1998","1997","1996","1995","1994","1993","1992","1991","1990","1989","1988","1987","1986","1985","1984","1983","1982","1981","1980","1979","1978","1977","1976","1975","1974","1973","1972","1971","1970","1969","1968","1967","1966","1965","1964","1963","1962","1961","1960","1959","1958","1957","1956","1955","1954","1953","1952","1951","1950","1949","1948","1947","1946","1945","1944","1943","1942","1941","1940","1939","1938","1937","1936","1935","1934","1933","1932","1931","1930","1929","1928","1927","1926","1925","1924","1923","1922","1921","1920","1919","1918","1917","1916","1915","1914","1913","1912","1911","1910","1909","1908","1907","1906","1905","1904","1903","1902","1901","1900","1899","1898","1897","1896","1895","1894","1893","1892","1891","1890","1889","1888","1887","1886","1885","1884","1883","1882","1881","1880"]
    
    var currentYearSelection = ""
    
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
        
        loadNameFile()
        
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
        girlNameLabel.text = ""
        
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
    
    func loadNameFile () {
        
        
        do {
            
            let fileName = Bundle.main.url(forResource: "yob" + girlYearPicker.text!, withExtension: "txt")
            let fileContents = try String(contentsOf: fileName!)
            
            let girlNameArray = fileContents.components(separatedBy: "\n")
            
            
            if currentElement < girlNameArray.count {
                
                girlNameLabel.text = girlNameArray[currentElement]
                currentElement += 1
                
            }
            
        } catch let error {
            print(error)
            
        }
    }
    
}

