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
        
        ToastStateInteractor.addToQueue(toast: toastWindow)
        getNextToastAndShow()
    }
    
    private func getNextToastAndShow() {
        ToastStateInteractor.nextToastToShow { (toastWindow) in
            guard let toastWindow = toastWindow else {
                return
            }
            self.showIfNotDisplaying(toastWindow)
        }
    }
    
    private func showIfNotDisplaying(_ toastWindow: ToastWindow) {
        ToastStateInteractor.isCurrentlyShowingToast(callback: { (isShowing) in
            guard isShowing == false else {
                print("Currently showing toast, ignoring")
                return
            }
            self.show(toastWindow: toastWindow)
        })
    }
    
    private func show(toastWindow: ToastWindow) {
        makeVisible(toastWindow)
        ToastStateInteractor.toggleIsShowing(true)
        
        //Hide
        DispatchQueue.main.asyncAfter(deadline: .now() + ToastConfiguration.shared.displayTime) {
            toastWindow.removeAndMakeInvisible()
            ToastStateInteractor.toggleIsShowing(false)
            ToastStateInteractor.removeLastToast {
                self.getNextToastAndShowSlightDelay()
            }
        }
    }
    
    private func getNextToastAndShowSlightDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + ToastConfiguration.shared.displayTime) {
            self.getNextToastAndShow()
        }
    }
    
    private func makeVisible(_ toastWindow: ToastWindow) {
        //TODO: Need to ensure this is center in all orientations.
        let centerOfScreen = UIScreen.main.bounds.center
        
        DispatchQueue.main.async {
            toastWindow.isHidden = false
            toastWindow.makeKeyAndVisible()
            toastWindow.center = centerOfScreen
        }
    }
}
    
