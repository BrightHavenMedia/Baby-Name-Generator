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
    
    public var boyFavoriteNames = [""]
    
    
    @IBOutlet weak var boyScreenLabel: UILabel!
   
    @IBOutlet weak var boyGenerate: UIButton!
    
    @IBOutlet weak var boyAddStyling: UIButton!
    
    
    @IBAction func boyAddFavorite(_ sender: UIButton) {
        
        sender.isSelected.toggle()
//        figure out why I need to force unwrap here with adding this name to the array.
        boyFavoriteNames.append((boyScreenLabel?.text)!)
    
    }
    
    
    @IBAction func showFavorites(_ sender: Any) {
    }
    
    
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

    

