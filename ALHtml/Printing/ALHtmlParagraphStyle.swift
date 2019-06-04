//
// Created by Apps AS on 05/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation
import UIKit

public class ALHtmlParagraphStyle {

    let font: UIFont
    let textColor: UIColor
    let backgroundColor: UIColor
    let lineSpacing: CGFloat
    let minimumLineHeight: CGFloat
    let sideMargins: SideMargins
    let alignment: NSTextAlignment

    public init(font: UIFont, textColor: UIColor, backgroundColor: UIColor, lineSpacing: CGFloat, minimumLineHeight: CGFloat, sideMargins: SideMargins, alignment: NSTextAlignment) {
        self.font = font
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.lineSpacing = lineSpacing
        self.minimumLineHeight = minimumLineHeight
        self.sideMargins = sideMargins
        self.alignment = alignment
    }

    public func getNSMutableParagraphStyle() -> NSMutableParagraphStyle {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = lineSpacing
        paragraph.minimumLineHeight = minimumLineHeight
        paragraph.lineBreakMode = NSLineBreakMode.byWordWrapping

        return paragraph
    }
}
