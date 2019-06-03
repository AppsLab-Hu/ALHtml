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
                                    textColor: UIColor.blue,
                                    highlightingColor: UIColor.lightGray
    )
    let boldStyle = ALHtmlBoldStyle(font: UIFont(name: "HelveticaNeue-Bold", size: 14)!, italicFont: UIFont(name: "HelveticaNeue-BoldItalic", size: 14)!)
    let italicStyle = ALHtmlItalicStyle(font: UIFont(name: "HelveticaNeue-Italic", size: 14)!, boldFont: UIFont(name: "HelveticaNeue-BoldItalic", size: 14)!)
    var headingStyles = [ALHtmlHeading.Level.H1: ALHtmlHeadingStyle(font: UIFont(name: "Helvetica", size: 22)!, textColor: UIColor.red, minimumLineHeight: 30, isAllCaps: false)]
    let listParagraphStyle = ALHtmlListParagraphStyle(headIndent: 42, firstLineHeadIndent: 14, tabStops:[NSTextTab(textAlignment: NSTextAlignment.natural, location: 42, options: [:])], font:UIFont(name: "HelveticaNeue-Italic", size: 14)!, lineSpacing:18, minimumLineHeight:18)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let printingContext = ALHtmlPrintingContext(theme: ALHtmlPrintingTheme(paragraphStyle: paragraphStyle, headingStyles: headingStyles, linkStyle: linkStyle, boldStyle: boldStyle, italicStyle: italicStyle, listParagraphStyle: listParagraphStyle))
        
        let string = "This is a string with html tags: <b>bold</b> <H1>header 1</H1> <u>underline</u> <p>paragraph</p> <p>paragraph</p> <p>paragraph</p>"
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

