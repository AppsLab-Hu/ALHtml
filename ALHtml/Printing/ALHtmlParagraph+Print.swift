//
// Created by Apps AS on 06/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation

extension ALHtmlParagraph: ALHtmlPrinting {

    public func printToContext(context: ALHtmlPrintingContext) {
        printAllElements(context: context)
    }
}
