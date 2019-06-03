//
//  ALHtmlStriketrough+Print.swift
//  ALHtml
//
//  Created by Tamás Szalay on 2019. 06. 03..
//  Copyright © 2019. AppsLab. All rights reserved.
//

import Foundation

extension ALHtmlStrikethrough: ALHtmlPrinting {
    
    public func printToContext(context: ALHtmlPrintingContext) {
        context.startStrikethroughPrinting()
        printAllElements(context: context)
        context.finishStrikethroughPrinting()
    }
}
