//
// Created by Apps AS on 16/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation

extension ALHtmlLineBreak: ALHtmlPrinting {

    public func printToContext(context: ALHtmlPrintingContext) {
        context.print(text: "\n")
    }

}
