//
// Created by Apps AS on 04/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation
import HTMLKit

public class ALHtmlParser {

    public init() {
    }
    
    public func parse(htmlContent: String) -> [ALHtmlElement] {
        let parser = HTMLParser(string: htmlContent)
        let document = parser.parseDocument()

        if document.body == nil {
            return []
        }

        let elements = gatherElements(rootNode: document.body!)
        return elements
    }

    private func gatherElements(rootNode: HTMLNode) -> [ALHtmlElement] {
        var elements = [ALHtmlElement]()
        for node in rootNode.childNodes {
            if let parsingNode = node as? HTMLNode {
                elements += parseNode(node: parsingNode)
            }
        }

        return elements
    }

    private func parseNode(node: HTMLNode) -> [ALHtmlElement] {
        switch Mirror(reflecting: node).subjectType {
        case is HTMLText.Type:
            let textNode = node as! HTMLText
            return [ALHtmlText(text: textNode.textContent)]
        case is HTMLElement.Type:
            let htmlElement = node as! HTMLElement
            return parseElement(element: htmlElement)
        default:
            return []
        }
    }

    private func parseElement(element: HTMLElement) -> [ALHtmlElement] {
        switch element.tagName {
        case "h1":
            return [ALHtmlHeading(text: parseElementText(element: element), level: .H1)]
        case "h2":
            return [ALHtmlHeading(text: parseElementText(element: element), level: .H2)]
        case "h3":
            return [ALHtmlHeading(text: parseElementText(element: element), level: .H3)]
        case "h4":
            return [ALHtmlHeading(text: parseElementText(element: element), level: .H4)]
        case "h5":
            return [ALHtmlHeading(text: parseElementText(element: element), level: .H5)]
        case "p":
            return [ALHtmlParagraph(elements: gatherElements(rootNode: element))]
        case "b", "strong":
            return [ALHtmlBold(elements: gatherElements(rootNode: element))]
        case "i", "em":
            return [ALHtmlItalic(elements: gatherElements(rootNode: element))]
        case "a":
            return [ALHtmlLink(linkText: gatherLinkTextFromNode(node: element), linkUrlString: gatherLinkUrlFromFromNode(node: element))]
        case "ul":
            return [ALHtmlList(items: gatherElements(rootNode: element), isOrdered: false)]
        case "ol":
            return [ALHtmlList(items: gatherElements(rootNode: element), isOrdered: true)]
        case "li":
            return [ALHtmlListItem(elements: gatherElements(rootNode: element))]
        case "br":
            return [ALHtmlLineBreak()]
        case "s":
            return [ALHtmlStrikethrough(elements: gatherElements(rootNode: element))]
        default:
            return [ALHtmlText(text: element.textContent)]
        }
    }

    private func parseElementText(element: HTMLElement) -> String {
        var elementText = ""
        for node in element.childNodes {
            if let textElement = node as? HTMLText {
                elementText += textElement.textContent
            }
        }
        return elementText
    }

    private func gatherLinkTextFromNode(node: HTMLElement) -> String {
        guard node.childNodesCount() > 0, let linkText = node.childNodes[0] as? HTMLText else {
            return ""
        }

        return linkText.textContent
    }

    private func gatherLinkUrlFromFromNode(node: HTMLElement) -> String {
        guard let linkUrlString = node.attributes["href"] as? String else {
            return ""
        }

        return linkUrlString
    }
}
