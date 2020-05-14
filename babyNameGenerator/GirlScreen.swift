//
//  GirlScreen.swift
//  babyNameGenerator
//
//  Created by James Jensen on 10/6/17.
//  Copyright © 2017 James Jensen. All rights reserved.
// when I press boy or girl it shuffles the array. When I click generate it ittereates through that array. Find a way to make each name display once. 

import Foundation
import UIKit

class GirlScreen: UIViewController {
    
    var currentElement = 0
    
    @IBOutlet weak var girlNameLabel: UILabel!
    
    @IBOutlet weak var girlGenerate: UIButton!
    
    @IBAction func addGirlFavorites(_ sender: Any) {
    }
    
    
    @IBAction func showFavorites(_ sender: Any) {
    }
    
    
  
    @IBAction func girlGeneratePress(_ sender: Any) {
        
        if currentElement < girlNameList.count {
            girlNameLabel.text = girlNameList[currentElement]
            
            currentElement += 1
            
        } else {
            girlNameLabel.text = "Sorry Out of Names"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        girlNameLabel.layer.cornerRadius = 10
        girlNameLabel.clipsToBounds = true
        girlGenerate.layer.cornerRadius = 20
        girlGenerate.clipsToBounds = true
        
        
    }
    
}
