    //
//  ToastProvider.swift
//  ToastProvider
//
//  Created by Harry Bloom on 16/08/2018.
//  Copyright © 2018 WeVat. All rights reserved.
//

import UIKit

public protocol ToastProvider {
    
    func showToast(withTitle title: String, subtitle: String?, image: UIImage?, animation: ToastViewAnimationType)
}

public extension ToastProvider {
    
    func showToast(withTitle title: String, subtitle: String?, image: UIImage?, animation: ToastViewAnimationType) {
        let toastView = ToastView(title: title, subtitle: subtitle, image: image)
        let toastWindow = ToastWindow(view: toastView, animationType: animation)
        
        let centerOfScreen = UIScreen.main.bounds.center
        show(withCenterPoint: centerOfScreen, toastWindow: toastWindow)
    }
    
    private func show(withCenterPoint center: CGPoint, toastWindow: ToastWindow) {
        toastWindow.isHidden = false
        toastWindow.makeKeyAndVisible()
        toastWindow.center = center
        
        DispatchQueue.main.asyncAfter(deadline: .now() + ToastConfiguration.shared.displayTime) {
            toastWindow.removeAndMakeInvisible()
        }
    }
}

public extension ToastProvider where Self: UIViewController {
    
    func showToast(withTitle title: String, subtitle: String?, image: UIImage?, animation: ToastViewAnimationType) {
        let toastView = ToastView(title: title, subtitle: subtitle, image: image)
        let toastWindow = ToastWindow(view: toastView, animationType: animation)
        
        show(withCenterPoint: self.view.center, toastWindow: toastWindow)
    }
}
    
