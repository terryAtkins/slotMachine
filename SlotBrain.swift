//
//  SlotBrain.swift
//  slotMachine
//
//  Created by terry atkins on 19/03/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

// take each column and place them in a new array to form a set of rows to compare.

class SlotBrain {
    class func unpackSlotsIntoSlotRows (slots: [[Slot]]) -> [[Slot]] {
        var slotRow: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        for slotArray in slots {
            // for element 0  in the columns
            for var index = 0; index < slotArray.count; index++ {
                let slot = slotArray[index]
                if index == 0 {
                    slotRow.append(slot)
                } // for element 1  in the columns
                else if index == 1 {
                    slotRow2.append(slot)
                } // for element 02 in the columns
                else if index == 2 {
                    slotRow3.append(slot)
                } // for anything else, should never be called
                else {
                    println("Error")
                }
            }
        }
        // create a new array and add the arrays
        var slotInRows: [[Slot]] = [slotRow, slotRow2, slotRow3]
        return slotInRows
    }
    
    class func computeWinnings (slots: [[Slot]]) -> Int {
        var slotsInRows = unpackSlotsIntoSlotRows(slots)
        var winnings = 0
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        for slotRow in slotsInRows {
            // for each row
            if checkFlush(slotRow) == true {
                println("flush")
                winnings += 1
                flushWinCount += 1
            }
            
            // check if three in a row i.e 2 2 2
            if checkThreeInARow(slotRow) {
                println("three in a row")
                winnings += 1
                straightWinCount += 1
            }
            
            // check if the cards in the row are the same cards
            if checkThreeOfAKind(slotRow) {
                println("Three of a Kind")
                winnings += 3
                threeOfAKindWinCount += 1
            }
            
        } // for loop end
        
        // if all three rows are flushes
        if flushWinCount == 3 {
            println("Royal Flush")
            winnings += 15
        }
        
        // if all rows are three in a row
        if straightWinCount == 3 {
            println("Epic straight")
            winnings += 1000
        }
        
        // if the cards in the row are the same cards
        if threeOfAKindWinCount == 3 {
            println("Threes all around")
            winnings += 50
        }
        
        return winnings
        
    } // computeWinnings end
    
    class func checkFlush (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
   
        // if all red
        if slot1.isRed == true && slot2.isRed == true && slot3.isRed == true {
            return true
        } // if all black
        else if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false {
            return true
        } // if a mix
        else {
            return false
        }
    }
    
    class func checkThreeInARow (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        // check if row of cards is simular to value of card 1 by subtracting
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true
        } // check if row of cards is simular to value of card 1 by adding
        else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2{
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeOfAKind (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        // if all cards are the same
        if slot1.value == slot2.value && slot1.value == slot3.value {
            return true
        }
        else {
            return false // if a mix
        }
    }
} // class end