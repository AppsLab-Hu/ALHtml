//
// Created by Apps AS on 07/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation
import UIKit

extension ALHtmlList: ALHtmlPrinting {

    public func printToContext(context: ALHtmlPrintingContext) {
        if !context.isEmpty() {
            context.print(text: "\n")
        }

        var bullet = 0
        let listParagraphAttribute = context.theme.listParagraphStyle.getNSParagraphStyle(paragraphStyle: context.theme.paragraphStyle)
        context.beginAttributes(attributes: [NSAttributedString.Key.paragraphStyle:listParagraphAttribute,
                                             NSAttributedString.Key.font: context.theme.listParagraphStyle.font
        ])
        for item in self.items {
            let nextBullet = getNextBullet(currentBullet: bullet)
            bullet = nextBullet.updatedBullet
            context.print(text: "\(nextBullet.bulletString)\t")
            if let printableItem = item as? ALHtmlPrinting {
                printableItem.printToContext(context: context)
            }
            context.print(text: "\n")
        }
        context.endAttributes()
    }

    private func getNextBullet(currentBullet: Int) -> (bulletString:String, updatedBullet: Int) {
        guard isOrdered else {
            return ("\u{2022}", 0)
        }

        let bullet = currentBullet + 1
        return ("\(bullet).", bullet)
    }
}
