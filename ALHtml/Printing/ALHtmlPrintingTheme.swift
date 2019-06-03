//
// Created by Apps AS on 05/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation
import UIKit

public class ALHtmlPrintingTheme {

    let paragraphStyle: ALHtmlParagraphStyle
    let headingStyles: [ALHtmlHeading.Level:ALHtmlHeadingStyle]
    let linkStyle: ALHtmlLinkStyle
    let boldStyle: ALHtmlBoldStyle
    let italicStyle: ALHtmlItalicStyle
    let listParagraphStyle: ALHtmlListParagraphStyle

    public init(paragraphStyle: ALHtmlParagraphStyle, headingStyles: [ALHtmlHeading.Level:ALHtmlHeadingStyle], linkStyle: ALHtmlLinkStyle, boldStyle: ALHtmlBoldStyle, italicStyle: ALHtmlItalicStyle, listParagraphStyle: ALHtmlListParagraphStyle) {
        self.paragraphStyle = paragraphStyle
        self.headingStyles = headingStyles
        self.linkStyle = linkStyle
        self.boldStyle = boldStyle
        self.italicStyle = italicStyle
        self.listParagraphStyle = listParagraphStyle
    }
}
