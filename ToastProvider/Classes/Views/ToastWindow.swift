//
//  ToastWindow.swift
//  ToastProvider
//
//  Created by Harry Bloom on 16/08/2018.
//

import UIKit

class ToastWindow: UIWindow {
    
    var view: UIView!
    
    convenience init(view: UIView) {
        self.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 250, height: 250)))
        self.view = view
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func makeKeyAndVisible() {
        super.makeKeyAndVisible()
        
        
    }
    
    private func setup() {
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        windowLevel = UIWindowLevelAlert + 1
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
