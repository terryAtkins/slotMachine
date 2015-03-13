//
//  Factory.swift
//  slotMachine
//
//  Created by terry atkins on 13/03/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation
import UIKit



class Factory {
    class func createSlots () -> [[Slot]] { // create function that returns an 2D array of Slot instances
        
        let kNumberOfSlots = 3
        let kNumberOfContainers = 3
        var slots: [[Slot]] = []
        for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber {
            var slotArray:[Slot] = []
            for var slotNumber = 0; slotNumber < kNumberOfSlots; slotNumber++ {
                var slot = Factory.createSlot(slotArray) // call the function createSlot and pass in slotArray
                slotArray.append(slot)
            }
            slots.append(slotArray)
        }
        return slots // return slots with a totle of 3 arrays each containing 3 arrays
    }
    
    class func createSlot(currentCards: [Slot]) -> Slot { // create a function that returns an array containing a Slot instances
        var currentCardValues:[Int] = [] // create an empty array of type interger
        
        for slot in currentCards { // for each slot in currentCards...
            currentCardValues.append(slot.value) // ...append to currentCardValue the poperty value from each slot....
        } // ... where is slot.value getting updated from the default value of 0?
        
        var randomNumber = Int(arc4random_uniform(UInt32(13)))
    
        while contains(currentCardValues, randomNumber + 1){ // check if  each element in currentCardValues matches randomNumber + 1...
            randomNumber = Int(arc4random_uniform(UInt32(13))) // ...if a match is found generate a new random number
        }
        
        var slot:Slot
        
        switch randomNumber { // assign to slot the Slot whoms case matches randomNumber
        case 0:
            slot = Slot(value: 1, image: UIImage(named: "Ace"), isRed: true)
        case 1:
            slot = Slot(value: 2, image: UIImage(named: "Two"), isRed: true)
        case 2:
            slot = Slot(value: 3, image: UIImage(named: "Three"), isRed: true)
        case 3:
            slot = Slot(value: 4, image: UIImage(named: "Four"), isRed: true)
        case 4:
            slot = Slot(value: 5, image: UIImage(named: "Five"), isRed: false)
        case 5:
            slot = Slot(value: 6, image: UIImage(named: "Six"), isRed: false)
        case 6:
            slot = Slot(value: 7, image: UIImage(named: "Seven"), isRed: true)
        case 7:
            slot = Slot(value: 8, image: UIImage(named: "Eight"), isRed: false)
        case 8:
            slot = Slot(value: 9, image: UIImage(named: "Nine"), isRed: false)
        case 9:
            slot = Slot(value: 10, image: UIImage(named: "Ten"), isRed: true)
        case 10:
            slot = Slot(value: 11, image: UIImage(named: "Jack"), isRed: false)
        case 11:
            slot = Slot(value: 12, image: UIImage(named: "Queen"), isRed: false)
        case 12:
            slot = Slot(value: 13, image: UIImage(named: "King"), isRed: true)
        default:
            slot = Slot(value: 0, image: UIImage(named: "Ace"), isRed: true)
        }
        return slot
        
    }
}






