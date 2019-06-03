//
//  SideMargins.swift
//  ALHtml
//
//  Created by Tamás Szalay on 2019. 06. 03..
//  Copyright © 2019. AppsLab. All rights reserved.
//

import Foundation
import UIKit

public class SideMargins {
    
    static var emptyMargins = SideMargins(left: 0, right: 0)
    
    let left: CGFloat
    let right: CGFloat
    
    public init(left: CGFloat, right: CGFloat) {
        self.left = left
        self.right = right
    }
}
