//
//  ViewController.swift
//  ToastProvider
//
//  Created by harryblam on 08/16/2018.
//  Copyright (c) 2018 harryblam. All rights reserved.
//

import UIKit
import ToastProvider

class ViewController: UIViewController, ToastProvider {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func showToast() {
        showToast(withMessage: "LOL", animated: true)
    }
}

