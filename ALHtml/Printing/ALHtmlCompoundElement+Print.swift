//
// Created by Apps AS on 06/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation

extension ALHtmlCompoundElement {

    public func printAllElements(context: ALHtmlPrintingContext) {
        self.elements.forEach() { element in
            if let printableElement = element as? ALHtmlPrinting {
                printableElement.printToContext(context: context)
            }
        }
    }
}
