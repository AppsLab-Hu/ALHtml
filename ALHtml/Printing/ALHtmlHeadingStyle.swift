//
// Created by Apps AS on 05/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation
import UIKit

public class ALHtmlHeadingStyle {

    let font: UIFont
    let textColor: UIColor
    let minimumLineHeight: CGFloat
    let isAllCaps: Bool

    public init(font: UIFont, textColor: UIColor, minimumLineHeight: CGFloat, isAllCaps: Bool) {
        self.font = font
        self.textColor = textColor
        self.minimumLineHeight = minimumLineHeight
        self.isAllCaps = isAllCaps
    }
}
