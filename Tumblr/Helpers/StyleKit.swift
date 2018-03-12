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
    case welcomeSearchButtonTitle, welcomeTextFieldPlaceholder, welcomeTextFieldTyping, blogCellAuthorName, blogTextCellContent,
    blogCellTags, blogCellDate, blogPhotoTitle, navBarTitle
}

public enum Color {
    case navyBlueBackground, welcomeSearchButtonColor, welcomeTextFieldBackground, welcomeTextFieldPlaceholder, blogCellHeader,
    blogCellTags, navBarTintColor
}

public enum ApplicationFont {
    case tagsViewFont
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
        case .blogCellAuthorName:
            attributedDictionary = attributedText(color: UIColor.darkGray,
                                                  font: UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.light))
        case .blogTextCellContent:
            attributedDictionary = attributedText(color: UIColor.darkGray,
                                                  font: UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.light))
        case .blogCellTags:
            attributedDictionary = attributedText(color: UIColor.darkGray,
                                                  font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light))
        case .blogCellDate:
            attributedDictionary = attributedText(color: UIColor.darkGray,
                                                  font: UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.light), alignment: .right)
        case .blogPhotoTitle:
            attributedDictionary = attributedText(color: UIColor.darkGray,
                                                  font: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light))
        case .navBarTitle:
            attributedDictionary = attributedText(color: UIColor.white,
                                                  font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular))
        }
        return attributedDictionary
    }
    
    static func attributedText(text: String, attribute: Attribute) -> NSAttributedString {
        return NSAttributedString(string: text, attributes: attributedText(attribute: attribute))
    }
    
    static func colorType(color: Color) -> UIColor {
        switch color {
        case .navyBlueBackground:
            return UIColor(hexString: "244461")!
        case .welcomeSearchButtonColor:
            return UIColor(hexString: "51B6D1")!
        case .welcomeTextFieldBackground:
            return UIColor(hexString: "59768D", transparency: 0.3)!
        case .welcomeTextFieldPlaceholder:
            return UIColor(hexString: "FFFFFF", transparency: 0.2)!
        case .blogCellHeader:
            return UIColor(hexString: "DDDDDD")!
        case .blogCellTags:
            return UIColor.lightGray
        case .navBarTintColor:
            return UIColor.white
        }
    }
    
    static func applicationFont(fontType: ApplicationFont) -> UIFont {
        switch fontType {
        case .tagsViewFont:
            return UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.light)
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
