//
//  shuffleArrayFunc.swift
//  babyNameGenerator
//
//  Created by James Jensen on 10/17/17.
//  Copyright © 2017 James Jensen. All rights reserved.
//

import Foundation
import UIKit

public extension MutableCollection where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j {
                self.swapAt(i, j)
            }
        }
    }
}

    

