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
    var constraintCache: NSLayoutConstraint?
    var configuration: ToastConfiguration
    
    private var animationDuration = TimeInterval(0.3)
    
    init(view: UIView, configuration: ToastConfiguration) {

        self.configuration = configuration

        super.init(frame: CGRect(origin: CGPoint(x: 0, y: 0),
        size: configuration.defaultSize))

        self.toastView = view
        self.animationType = configuration.animation

        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = configuration.overrideUserInterfaceStyle
        }
    }

    required init?(coder aDecoder: NSCoder) {
        self.configuration = ToastConfiguration()
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
        windowLevel = UIWindow.Level.alert + 1
    }
}
