//
//  ViewController.swift
//  babyNameGenerator
//
//  Created by James Jensen on 10/3/17.
//  Copyright © 2017 James Jensen. All rights reserved.
//

import UIKit

class StartScreen: UIViewController {
    
    
    
    @IBAction func boyButtonPress(_ sender: Any) {
//        boyNameList.shuffle()
        
    }
    
    @IBAction func girlButtonPress(_ sender: Any) {
//        girlNameList.shuffle()
    }
    @IBOutlet weak var boyButton: UIButton!
    
    @IBOutlet weak var girlButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boyButton.layer.cornerRadius = 20
        boyButton.clipsToBounds = true
        girlButton.layer.cornerRadius = 20
        girlButton.clipsToBounds = true
        navigationItem.title = "Baby Name Generator"
        
        
        
    }

}

