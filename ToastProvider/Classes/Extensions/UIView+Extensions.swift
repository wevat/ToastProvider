    //
//  ToastProvider.swift
//  ToastProvider
//
//  Created by Harry Bloom on 16/08/2018.
//  Copyright © 2018 WeVat. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
