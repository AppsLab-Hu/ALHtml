//
// Created by Apps AS on 06/03/16.
// Copyright (c) 2016 All rights reserved.
//

import Foundation

public class ALHtmlPrintingStyleQueue {

    private var queue = [(range:NSRange, attributeName:NSAttributedString.Key, attributeValue:AnyObject)]()
    public func enqueueStyle(rangeStart: Int, attributeName: NSAttributedString.Key, attributeValue: AnyObject) -> Int {
        queue.append((NSMakeRange(rangeStart, 0), attributeName, attributeValue))
        return queue.count-1
    }

    public func styleComplete(queueItemId: Int, characterIndex: Int) -> [(range:NSRange, attributeName:NSAttributedString.Key, attributeValue:AnyObject)] {
        guard queueItemId < queue.count else {
            return []
        }

        var queueItem = queue[queueItemId]
        let completeRange = NSMakeRange(queueItem.range.location, characterIndex-queueItem.range.location+1)
        queueItem.range = completeRange
        queue[queueItemId] = queueItem

        if queueItemId != 0 {
            return []
        }

        let completeQueue = queue
        queue.removeAll()
        return completeQueue
    }
}
