//
//  ViewController.swift
//  Test
//
//  Created by Tamás Szalay on 2019. 06. 03..
//  Copyright © 2019. AppsLab. All rights reserved.
//

import UIKit
import ALHtml

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    let paragraphStyle = ALHtmlParagraphStyle(font: UIFont(name: "Helvetica", size: 14)!,
                                              textColor: UIColor.black,
                                              backgroundColor: UIColor.white,
                                              lineSpacing: 5,
                                              minimumLineHeight: 18,
                                              sideMargins: SideMargins(left: 12, right: 12)
    )
    let linkStyle = ALHtmlLinkStyle(font: UIFont(name: "Helvetica-Bold", size: 14)!,
                                    textColor: UIColor.blue
    )
    let boldStyle = ALHtmlBoldStyle(font: UIFont(name: "HelveticaNeue-Bold", size: 14)!, italicFont: UIFont(name: "HelveticaNeue-BoldItalic", size: 14)!)
    let italicStyle = ALHtmlItalicStyle(font: UIFont(name: "HelveticaNeue-Italic", size: 14)!, boldFont: UIFont(name: "HelveticaNeue-BoldItalic", size: 14)!)
    var headingStyles = [ALHtmlHeading.Level.H1: ALHtmlHeadingStyle(font: UIFont(name: "Helvetica", size: 22)!, textColor: UIColor.red, minimumLineHeight: 30, isAllCaps: false)]
    let listParagraphStyle = ALHtmlListParagraphStyle(headIndent: 42, firstLineHeadIndent: 14, tabStops:[NSTextTab(textAlignment: NSTextAlignment.natural, location: 42, options: [:])], font:UIFont(name: "HelveticaNeue-Italic", size: 14)!, lineSpacing:18, minimumLineHeight:18)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let printingContext = ALHtmlPrintingContext(theme: ALHtmlPrintingTheme(paragraphStyle: paragraphStyle, headingStyles: headingStyles, linkStyle: linkStyle, boldStyle: boldStyle, italicStyle: italicStyle, listParagraphStyle: listParagraphStyle))
        
        let string = "Headset equipment product description <br /><H1>Header 1</H1> <br /><H2>Header 2</H2> <br /><H3>Header 3</H3> <br /><p>This is a paragraph</p> <br /><a href=\"http://www.help.no\">This is a link</a> <br /><strong>Strong text with strong tag</strong> <br /><b><s>strikethrough text with s tag</s></b> <br /><em>List item 1</em> <br /><em>List item 2</em> <br />"
        let htmlContent = ALHtmlParser().parse(htmlContent: string)
        
        for htmlElement in htmlContent {
            if let printableElement = htmlElement as? ALHtmlPrinting {
                printableElement.printToContext(context: printingContext)
            }
        }
        
        let attributedString = printingContext.attributedString
        label.attributedText = attributedString
    }


}

