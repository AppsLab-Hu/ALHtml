//
// Created by Apps AS on 07/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation

extension ALHtmlListItem: ALHtmlPrinting {

    public func printToContext(context: ALHtmlPrintingContext) {
        printAllElements(context: context)
    }

}
