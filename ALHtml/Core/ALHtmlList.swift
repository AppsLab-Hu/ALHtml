//
// Created by Apps AS on 04/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation

public class ALHtmlList: ALHtmlElement {

    let items: [ALHtmlElement]
    let isOrdered: Bool

    public init(items: [ALHtmlElement], isOrdered: Bool) {
        self.items = items
        self.isOrdered = isOrdered
    }
}
