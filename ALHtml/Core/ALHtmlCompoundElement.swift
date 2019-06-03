//
// Created by Apps AS on 04/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation

public class ALHtmlCompoundElement: ALHtmlElement {

    var elements = [ALHtmlElement]()

    public init(elements: [ALHtmlElement]) {
        self.elements = elements
    }
}
