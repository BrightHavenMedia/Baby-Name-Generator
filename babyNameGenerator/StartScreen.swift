//
//  ViewController.swift
//  babyNameGenerator
//
//  Created by James Jensen on 10/3/17.
//  Copyright © 2017 James Jensen. All rights reserved.
//

import UIKit

class StartScreen: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var listOfYears = ["1880", "1881", "1882", "1883"]
    
    
    @IBAction func boyButtonPress(_ sender: Any) {
        boyNameList.shuffle()
        
    }
    
    @IBAction func girlButtonPress(_ sender: Any) {
        girlNameList.shuffle()
    }
    @IBOutlet weak var boyButton: UIButton!
    @IBOutlet weak var girlButton: UIButton!
    @IBOutlet weak var dateFieldPicker: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePicker = UIPickerView()
        
        dateFieldPicker.inputView = datePicker
        datePicker.delegate = self
        
        
        
        boyButton.layer.cornerRadius = 20
        boyButton.clipsToBounds = true
        girlButton.layer.cornerRadius = 20
        girlButton.clipsToBounds = true
        navigationItem.title = "Baby Name Generator"
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfYears.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dateFieldPicker.text = listOfYears[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listOfYears[row]
    }
    
}

