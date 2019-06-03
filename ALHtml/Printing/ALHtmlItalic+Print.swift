//
// Created by Apps AS on 06/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation

extension ALHtmlItalic: ALHtmlPrinting {

    public func printToContext(context: ALHtmlPrintingContext) {
        context.startItalicPrinting()
        printAllElements(context: context)
        context.finishItalicPrinting()
    }
}
