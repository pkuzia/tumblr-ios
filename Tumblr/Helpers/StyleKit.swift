//
//  StyleKit.swift
//  RIG
//
//  Created by Przemysław Kuzia on 7/29/17
//  Copyright © 2018 pkuzia. All rights reserved.
//

import Foundation
import SwifterSwift

public enum Attribute {
    case welcomeSearchButtonTitle, welcomeTextFieldPlaceholder, welcomeTextFieldTyping
}

public enum Color {
    case welcomeNavyBlueBackground, welcomeSearchButtonColor, welcomeTextFieldBackground, welcomeTextFieldPlaceholder
}


class StyleKit {

    static func attributedText(attribute: Attribute) -> [NSAttributedStringKey: Any] {
        var attributedDictionary = [NSAttributedStringKey: Any]()
        switch attribute {
        case .welcomeSearchButtonTitle:
            attributedDictionary = attributedText(color: UIColor.white,
                                                   font: UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.light))
        case .welcomeTextFieldPlaceholder:
            attributedDictionary = attributedText(color: colorType(color: .welcomeTextFieldPlaceholder),
                                                  font: UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.light), alignment: .center)
        case .welcomeTextFieldTyping:
            attributedDictionary = attributedText(color: UIColor.white,
                                                  font: UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.light), alignment: .center)
        }
        return attributedDictionary
    }
    
    static func attributedText(text: String, attribute: Attribute) -> NSAttributedString {
        return NSAttributedString(string: text, attributes: attributedText(attribute: attribute))
    }
    
    static func colorType(color: Color) -> UIColor {
        switch color {
        case .welcomeNavyBlueBackground:
            return UIColor(hexString: "244461")!
        case .welcomeSearchButtonColor:
            return UIColor(hexString: "51B6D1")!
        case .welcomeTextFieldBackground:
            return UIColor(hexString: "59768D", transparency: 0.3)!
        case .welcomeTextFieldPlaceholder:
            return UIColor(hexString: "FFFFFF", transparency: 0.2)!
        }
    }
    
    static func convertToTypingAttributes(attribute: Attribute) -> [String: Any] {
        let attr = attributedText(attribute: attribute)
        var result = [String: Any]()
        for (k,v) in attr {
            result[k.rawValue] = v
        }
        return result
    }
    
    static func attributedText(color: UIColor, font: UIFont, alignment: NSTextAlignment = .left) -> [NSAttributedStringKey: Any] {
        var attributedText = [NSAttributedStringKey: Any]()
        attributedText[NSAttributedStringKey.foregroundColor] = color
        attributedText[NSAttributedStringKey.font] = font
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3.5
        paragraphStyle.alignment = alignment
        
        attributedText[NSAttributedStringKey.paragraphStyle] = paragraphStyle
        
        return attributedText
    }
}
