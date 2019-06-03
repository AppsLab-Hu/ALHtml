//
// Created by Apps AS on 05/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation
import UIKit

public class ALHtmlParagraphStyle {

    var font: UIFont
    var textColor: UIColor
    var backgroundColor: UIColor
    let lineSpacing: CGFloat
    let minimumLineHeight: CGFloat
    let sideMargins: SideMargins

    public init(font: UIFont, textColor: UIColor, backgroundColor: UIColor, lineSpacing: CGFloat, minimumLineHeight: CGFloat, sideMargins: SideMargins) {
        self.font = font
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.lineSpacing = lineSpacing
        self.minimumLineHeight = minimumLineHeight
        self.sideMargins = sideMargins
    }

    public func getNSMutableParagraphStyle() -> NSMutableParagraphStyle {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = lineSpacing
        paragraph.minimumLineHeight = minimumLineHeight
        paragraph.lineBreakMode = NSLineBreakMode.byWordWrapping

        return paragraph
    }
}
