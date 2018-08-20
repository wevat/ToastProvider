//
//  TempView.swift
//  Pods-ToastProvider_Example
//
//  Created by Harry Bloom on 16/08/2018.
//

import UIKit

class TempView: UIView {
    
    convenience init() {
        self.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 250, height: 250)))
        backgroundColor = UIColor.red
        cornerRadius = 3
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
