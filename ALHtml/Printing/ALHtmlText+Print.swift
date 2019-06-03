//
// Created by Apps AS on 05/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation

extension ALHtmlText: ALHtmlPrinting {

    public func printToContext(context: ALHtmlPrintingContext) {
        context.print(text: self.text)
    }
}
