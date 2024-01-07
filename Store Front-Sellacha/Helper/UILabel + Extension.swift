//
//  UILabel + Extension.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 07/01/24.
//

import Foundation
import UIKit
extension UILabel {
    func addStrikethrough(_ strikethroughStyle: NSUnderlineStyle, strikethroughColor: UIColor = .clear) {
        guard let labelText = text else { return }
        
        let attributedText = NSMutableAttributedString(string: labelText)

        attributedText.addAttribute(NSAttributedString.Key.strikethroughStyle, value: strikethroughStyle.rawValue, range: NSMakeRange(0, attributedText.length))
        attributedText.addAttribute(NSAttributedString.Key.strikethroughColor, value: strikethroughColor, range: NSMakeRange(0, attributedText.length))
        self.attributedText = attributedText
    }
}
