//
// Created by Apps AS on 04/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation

public class ALHtmlLink: ALHtmlElement {

    let linkUrlString: String
    let linkText: String

    public init(linkText: String, linkUrlString: String) {
        self.linkText = linkText
        self.linkUrlString = linkUrlString
    }
}
