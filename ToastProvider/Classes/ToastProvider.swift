//
//  ToastProvider.swift
//  ToastProvider
//
//  Created by Harry Bloom on 16/08/2018.
//  Copyright © 2018 WeVat. All rights reserved.
//

import UIKit

public protocol ToastProvider {
    
    func showToast(withTitle title: String,
                   subtitle: String?,
                   image: UIImage?,
                   animation: ToastViewAnimationType,
                   displayTime: TimeInterval,
                   displaySize: CGSize)
}

public extension ToastProvider {
    
    func showToast(withTitle title: String,
                   subtitle: String?,
                   image: UIImage?,
                   animation: ToastViewAnimationType,
                   displayTime: TimeInterval = ToastConfiguration.shared.displayTime,
                   displaySize: CGSize = ToastConfiguration.shared.defaultSize) {
        
        let toastView = ToastView(title: title, subtitle: subtitle, image: image)
        let toastWindow = ToastWindow(view: toastView, animationType: animation, size: displaySize)
        let displayConfig = ToastDisplayConfig(window: toastWindow, displayTime: displayTime, displaySize: displaySize)
        
        ToastStateInteractor.addToQueue(toast: displayConfig)
        getNextToastAndShow()
    }
    
    private func getNextToastAndShow() {
        ToastStateInteractor.nextToastToShow { (displayConfig) in
            guard let displayConfig = displayConfig else {
                return
            }
            self.showIfNotDisplaying(displayConfig)
        }
    }
    
    private func showIfNotDisplaying(_ displayConfig: ToastDisplayConfig) {
        ToastStateInteractor.isCurrentlyShowingToast(callback: { (isShowing) in
            guard isShowing == false else {
                print("Currently showing toast, ignoring")
                return
            }
            self.show(displayConfig: displayConfig)
        })
    }
    
    private func show(displayConfig: ToastDisplayConfig) {
        makeVisible(displayConfig.window)
        ToastStateInteractor.toggleIsShowing(true)
        
        //Hide
        DispatchQueue.main.asyncAfter(deadline: .now() + displayConfig.displayTime) {
            displayConfig.window.removeAndMakeInvisible()
            ToastStateInteractor.toggleIsShowing(false)
            ToastStateInteractor.removeLastToast {
                self.getNextToastAndShowSlightDelay()
            }
        }
    }
    
    private func getNextToastAndShowSlightDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
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
