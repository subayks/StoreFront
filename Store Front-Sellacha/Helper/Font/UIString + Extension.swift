//
//  UIString + Extension.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 13/01/24.
//

import Foundation
extension String {
    
    func containsOnlyDigits() -> Bool
    {
        
        let notDigits = NSCharacterSet.decimalDigits.inverted
        
        if rangeOfCharacter(from: notDigits, options: String.CompareOptions.literal, range: nil) == nil
        {
            return true
        }
        
        return false
    }
    
    func grouping(every groupSize: String.IndexDistance, with separator: Character) -> String {
           let cleanedUpCopy = replacingOccurrences(of: String(separator), with: "")
           return String(cleanedUpCopy.enumerated().map() {
                $0.offset % groupSize == 0 ? [separator, $0.element] : [$0.element]
           }.joined().dropFirst())
        }
}
