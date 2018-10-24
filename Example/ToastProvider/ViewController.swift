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
        showToast(withTitle: "Toast", subtitle: "Description of toast message. Could be long, or could be short, you decide.", image: nil, animation: .verticalBlinds, displayTime: 2, displaySize: CGSize(width: 350, height: 350))
    }
}

