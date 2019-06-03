//
// Created by Apps AS on 04/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation

public class ALHtmlHeading: ALHtmlElement {

    public enum Level {
        case H1, H2, H3, H4, H5
    }

    let level: Level
    let text: String

    public init(text: String, level: Level) {
        self.text = text
        self.level = level
    }
}
