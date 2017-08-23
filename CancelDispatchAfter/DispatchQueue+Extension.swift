//
//  DispatchQueue+Extension.swift
//  CancelDispatchAfter
//
//  Created by Henry on 8/23/17.
//  Copyright © 2017 Pyrogusto Inc. All rights reserved.
//

import Foundation

extension DispatchQueue {
    class Task {
        private(set) var canceled: Bool = false
        private(set) var closure: () -> Void
        func cancel() {
            canceled = true
        }
        init(_ closure:@escaping ()->Void) {
            self.closure = closure
        }
    }
    
    func asycAfter(delayInSecond: Int, task: Task) {
        let deadlineTime: DispatchTime = DispatchTime.now() + DispatchTimeInterval.seconds(delayInSecond)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
            if !task.canceled {
                task.closure()
            }
        })
    }
}
