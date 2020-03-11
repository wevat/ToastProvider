//
//  CGRect+Extensions.swift
//  ToastProvider
//
//  Created by Harry Bloom on 21/08/2018.
//

import UIKit

extension CGRect {
    
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
}
