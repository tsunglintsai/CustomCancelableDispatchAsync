//
//  DispatchAfterCancel.swift
//  CancelDispatchAfter
//
//  Created by Henry on 8/22/17.
//  Copyright © 2017 Pyrogusto Inc. All rights reserved.
//

import Foundation

class DispatchAfterCancel {
    static func dispatchAfter(second: Int, closure: @escaping ()->Void) -> CancelableTask {
        let cancelAbleTask = CancelableTask()
        cancelAbleTask.runTask(closure: closure, afterDelayInSecond: second)
        return cancelAbleTask
    }
}


class CancelableTask {
    private var canceled = false
    func cancelTask() {
        canceled = true
    }

    func runTask(closure:@escaping ()->Void, afterDelayInSecond: Int) {
        let deadlineTime: DispatchTime = DispatchTime.now() + DispatchTimeInterval.seconds(afterDelayInSecond)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            if !self.canceled {
                closure()
            }
        }
    }
}
