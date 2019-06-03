//
// Created by Apps AS on 05/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation
import UIKit

public class ALHtmlPrintingContext {

    private (set) var text: String = ""
    let theme: ALHtmlPrintingTheme
    var linkDescriptors = [(characterRange: NSRange, linkUrlString: String)]()

    public var attributedString: NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        paragraphStyle.lineSpacing = theme.paragraphStyle.lineSpacing
        paragraphStyle.minimumLineHeight = theme.paragraphStyle.minimumLineHeight
        paragraphStyle.hyphenationFactor = 1.0
        let attributes = [
            NSAttributedString.Key.font: theme.paragraphStyle.font,
            NSAttributedString.Key.foregroundColor: theme.paragraphStyle.textColor,
            NSAttributedString.Key.backgroundColor: theme.paragraphStyle.backgroundColor,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        for rangeAttribute in rangeAttributes {
            attributedString.addAttributes(rangeAttribute.attributes, range:rangeAttribute.range)
        }
        
        for link in linkDescriptors {
            attributedString.addAttribute(.underlineStyle, value: NSNumber(0), range: link.characterRange)
        }
        
        return attributedString
    }


    public init(theme: ALHtmlPrintingTheme) {
        self.theme = theme
    }

    public func clear() {
        text = ""
        linkDescriptors.removeAll()
        rangeAttributes.removeAll()
    }

    public func isEmpty() -> Bool {
        return text == ""
    }

    public func print(text: String) {
        self.text += text
    }

    private var rangeAttributes = [(range:NSRange, attributes:[NSAttributedString.Key: AnyObject])]()
    public func print(text: String, attributes: [NSAttributedString.Key:AnyObject]) {
        let range = NSMakeRange(self.text.count, text.count)
        rangeAttributes.append((range, attributes))
        self.print(text: text)
    }

    private var beginAttributesIndex: Int?
    private var begunAttributes: [NSAttributedString.Key: AnyObject]?
    public func beginAttributes(attributes: [NSAttributedString.Key: AnyObject]) {
        beginAttributesIndex = self.text.count
        begunAttributes = attributes
    }

    public func endAttributes() {
        guard beginAttributesIndex != nil else {
            return
        }

        let range = NSMakeRange(beginAttributesIndex!, self.text.count-beginAttributesIndex!)
        rangeAttributes.append((range, begunAttributes!))
    }

    public func printLink(linkText: String, linkUrlString: String) {
        let linkCharacterRange = NSMakeRange(self.text.count, linkText.count)
        linkDescriptors.append((linkCharacterRange, linkUrlString))
        let linkAttributes = [NSAttributedString.Key.font: theme.linkStyle.font, NSAttributedString.Key.foregroundColor: theme.linkStyle.textColor, NSAttributedString.Key.link: linkUrlString] as [NSAttributedString.Key : AnyObject]
        self.print(text: linkText, attributes: linkAttributes)
    }

    private let styleQueue = ALHtmlPrintingStyleQueue()
    private var boldPrintingState : (queueItemId: Int, counter: Int) = (0, 0)
    public func startBoldPrinting() {
        if boldPrintingState.counter == 0 {
            if italicPrintingState.counter == 0 {
                boldPrintingState.queueItemId = styleQueue.enqueueStyle(rangeStart: self.text.count, attributeName:NSAttributedString.Key.font, attributeValue: theme.boldStyle.font)
            } else {
                boldPrintingState.queueItemId = styleQueue.enqueueStyle(rangeStart: self.text.count, attributeName:NSAttributedString.Key.font, attributeValue: theme.boldStyle.italicFont)
            }
        }
        boldPrintingState.counter += 1
    }

    public func finishBoldPrinting() {
        if boldPrintingState.counter <= 1 {
            boldPrintingState.counter = 0
            let styles = styleQueue.styleComplete(queueItemId: boldPrintingState.queueItemId, characterIndex: self.text.count-1)
            for style in styles {
                rangeAttributes.append((style.range, [style.attributeName:style.attributeValue]))
            }
        } else {
            boldPrintingState.counter -= 1
        }
    }

    private var italicPrintingState : (queueItemId: Int, counter: Int) = (0, 0)
    public func startItalicPrinting() {
        if italicPrintingState.counter == 0 {
            if boldPrintingState.counter == 0 {
                italicPrintingState.queueItemId = styleQueue.enqueueStyle(rangeStart: self.text.count, attributeName: NSAttributedString.Key.font, attributeValue: theme.italicStyle.font)
            } else {
                italicPrintingState.queueItemId = styleQueue.enqueueStyle(rangeStart: self.text.count, attributeName: NSAttributedString.Key.font, attributeValue: theme.italicStyle.boldFont)
            }
        }
        italicPrintingState.counter += 1
    }

    public func finishItalicPrinting() {
        if italicPrintingState.counter <= 1 {
            italicPrintingState.counter = 0
            let styles = styleQueue.styleComplete(queueItemId: italicPrintingState.queueItemId, characterIndex: self.text.count-1)
            for style in styles {
                rangeAttributes.append((style.range, [style.attributeName:style.attributeValue]))
            }
        } else {
            italicPrintingState.counter -= 1
        }
    }
    
    private var strikethroughPrintingState : (queueItemId: Int, counter: Int) = (0, 0)
    public func startStrikethroughPrinting() {
        if strikethroughPrintingState.counter == 0 {
            strikethroughPrintingState.queueItemId = styleQueue.enqueueStyle(rangeStart: self.text.count, attributeName:NSAttributedString.Key.strikethroughStyle, attributeValue: NSUnderlineStyle.single.rawValue as AnyObject)
        }
        strikethroughPrintingState.counter += 1
    }
    
    public func finishStrikethroughPrinting() {
        if strikethroughPrintingState.counter <= 1 {
            strikethroughPrintingState.counter = 0
            let styles = styleQueue.styleComplete(queueItemId: strikethroughPrintingState.queueItemId, characterIndex: self.text.count-1)
            for style in styles {
                rangeAttributes.append((style.range, [style.attributeName:style.attributeValue]))
            }
        } else {
            strikethroughPrintingState.counter -= 1
        }
    }
}
