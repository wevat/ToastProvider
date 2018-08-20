//
//  ToastProvider.swift
//  ToastProvider
//
//  Created by Harry Bloom on 16/08/2018.
//  Copyright © 2018 WeVat. All rights reserved.
//

import UIKit

public protocol ToastProvider {
    
    func showToast(withMessage: String, animated: Bool)
}

public extension ToastProvider {
    
    func showToast(withMessage message: String, animated: Bool) {
//        let toastView = ToastView(title: message, subtitle: nil)
        let toastView = TempView()
        let toastWindow = ToastWindow(view: toastView)
        
        toastWindow.isHidden = false
        toastWindow.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + ToastConfiguration.shared.displayTime) {
            toastWindow.isHidden = true
            toastWindow.resignKey()
        }
    }
    
    private func animateAddWindow(window: UIWindow) {
        UIView.animate(withDuration: 0.3) {
            window.isHidden = false
            window.makeKeyAndVisible()
        }
    }

    private func removeView(superview: UIView) {

    }
}
