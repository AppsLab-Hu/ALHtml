//
// Created by Apps AS on 05/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation
import UIKit

extension ALHtmlHeading: ALHtmlPrinting {

    public func printToContext(context: ALHtmlPrintingContext) {
        guard let headingSyle = context.theme.headingStyles[self.level] else {
            context.print(text: self.text)
            return
        }

        let printingText = headingSyle.isAllCaps ? self.text.uppercased() : self.text
        let paragraphStyle = context.theme.paragraphStyle.getNSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = headingSyle.minimumLineHeight
        let attributes = [NSAttributedString.Key.font: headingSyle.font,
                          NSAttributedString.Key.foregroundColor: headingSyle.textColor,
                          NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        context.print(text: printingText, attributes: attributes)
        if headingSyle.addExtraLine {
            context.print(text: "\n")
        }
    }

}
