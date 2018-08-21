//
//  CGRect+Extensions.swift
//  ToastProvider
//
//  Created by Harry Bloom on 21/08/2018.
//

import Foundation

extension CGRect {
    
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
}
