//
//  ViewController.swift
//  CancelDispatchAfter
//
//  Created by Henry on 8/22/17.
//  Copyright © 2017 Pyrogusto Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var task: DispatchQueue.Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        task = DispatchQueue.Task{ [weak self] in
            self?.label.text = "complete"
        }
        if let task = task {
            DispatchQueue.main.asycAfter(delayInSecond: 5, task: task)
        }
    }
    @IBAction func didTapCancelButton(_ sender: Any) {
        task?.cancel()
    }
}
