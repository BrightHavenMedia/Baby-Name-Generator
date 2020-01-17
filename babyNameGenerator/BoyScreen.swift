//
//  BoyScreen.swift
//  babyNameGenerator
//
//  Created by James Jensen on 10/6/17.
//  Copyright © 2017 James Jensen. All rights reserved.
//

import Foundation
import UIKit


class BoyScreen: UIViewController {
    
    var currentElement = 0
    
    
    
    @IBOutlet weak var boyScreenLabel: UILabel!
   
    @IBOutlet weak var boyGenerate: UIButton!
    
    @IBAction func boyGeneratePress(_ sender: Any) {
        
        if currentElement < boyNameList.count {
            boyScreenLabel.text = boyNameList[currentElement]
            
            currentElement += 1
            
        } else {
            boyScreenLabel.text = "Sorry Out of Names"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

            
        boyScreenLabel.layer.cornerRadius = 10
        boyScreenLabel.clipsToBounds = true
        boyGenerate.layer.cornerRadius = 20
        boyGenerate.clipsToBounds = true
        
        
    }
    
}

    

