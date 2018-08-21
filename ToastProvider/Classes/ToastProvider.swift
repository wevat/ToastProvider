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
        let toastView = ToastView(title: message, subtitle: nil)
        let toastWindow = ToastWindow(view: toastView)
        
        toastWindow.isHidden = false
        toastWindow.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + ToastConfiguration.shared.displayTime) {
            toastWindow.removeAndMakeInvisible()
        }
    }
}
