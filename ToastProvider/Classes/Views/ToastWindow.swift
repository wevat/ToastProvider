//
//  ToastWindow.swift
//  ToastProvider
//
//  Created by Harry Bloom on 16/08/2018.
//

import UIKit

class ToastWindow: UIWindow, ToastViewAnimator {
    
    var toastView: UIView!
    var animationType: ToastViewAnimationType!
    
    private var animationDuration = TimeInterval(0.3)
    
    convenience init(view: UIView, animationType: ToastViewAnimationType) {
        self.init(frame: CGRect(origin: CGPoint(x: 0, y: 0),
                                size: ToastConfiguration.shared.defaultSize))
        self.toastView = view
        self.animationType = animationType
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func makeKeyAndVisible() {
        super.makeKeyAndVisible()
        
        addViewWithAnimation(view: toastView, animationDuration: animationDuration, animationType: animationType)
    }
    
    func removeAndMakeInvisible() {
        
        removeViewWithAnimation(view: toastView, animationDuration: animationDuration, animationType: animationType) {
            self.isHidden = true
            self.resignKey()
        }
    }
    
    private func setup() {
        isUserInteractionEnabled = false
        windowLevel = UIWindowLevelAlert + 1
    }
}
