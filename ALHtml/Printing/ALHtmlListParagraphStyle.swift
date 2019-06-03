//
// Created by Apps AS on 07/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation
import UIKit

public class ALHtmlListParagraphStyle {

    let headIndent: CGFloat
    let firstLineHeadIndent: CGFloat
    let tabStops: [NSTextTab]
    let font: UIFont
    let lineSpacing: CGFloat
    let minimumLineHeight: CGFloat

    public init(headIndent: CGFloat, firstLineHeadIndent: CGFloat, tabStops: [NSTextTab], font: UIFont, lineSpacing: CGFloat, minimumLineHeight: CGFloat) {
        self.headIndent = headIndent
        self.firstLineHeadIndent = firstLineHeadIndent
        self.tabStops = tabStops
        self.font = font
        self.lineSpacing = lineSpacing
        self.minimumLineHeight = minimumLineHeight
    }

    public func getNSParagraphStyle(paragraphStyle: ALHtmlParagraphStyle) -> NSParagraphStyle {
        let listParagraphStyle = paragraphStyle.getNSMutableParagraphStyle()
        listParagraphStyle.headIndent = headIndent
        listParagraphStyle.firstLineHeadIndent = firstLineHeadIndent
        listParagraphStyle.tabStops = tabStops
        listParagraphStyle.lineSpacing = lineSpacing
        listParagraphStyle.minimumLineHeight = minimumLineHeight

        return listParagraphStyle
    }
}
