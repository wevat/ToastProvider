//
//  ToastViewAnimator.swift
//  ToastProvider
//
//  Created by Harry Bloom on 23/08/2018.
//

import UIKit

protocol ToastViewAnimator {
    
    func addViewWithAnimation(view: UIView, animationDuration: TimeInterval, animationType: ToastViewAnimationType)
    func removeViewWithAnimation(view: UIView, animationDuration: TimeInterval, animationType: ToastViewAnimationType, completion: @escaping (() -> Void))
}

extension ToastViewAnimator where Self: UIView {
    
    func addViewWithAnimation(view: UIView, animationDuration: TimeInterval, animationType: ToastViewAnimationType) {
        addView(view: view)
        
        switch animationType {
        case .alphaFade:
            animateViewAddWithFade(view, animationDuration)
        default:
            break
        }
        
    }
    
    func removeViewWithAnimation(view: UIView, animationDuration: TimeInterval, animationType: ToastViewAnimationType, completion: @escaping (() -> Void)) {
        switch animationType {
        case .alphaFade:
            animateViewRemoveWithFade(view, animationDuration, completion)
        default:
            break
        }
    }
    
    private func addView(view: UIView) {
        guard subviews.contains(view) == false else {
            return
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.widthAnchor.constraint(equalToConstant: ToastConfiguration.shared.defaultSize.width).isActive = true
        view.heightAnchor.constraint(equalToConstant: ToastConfiguration.shared.defaultSize.height).isActive = true
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

//MARK: Fade animations
extension ToastViewAnimator where Self: UIView {

    private func animateViewAddWithFade(_ view: UIView, _ animationDuration: TimeInterval) {
        view.alpha = 0
        UIView.animate(withDuration: animationDuration) {
            view.alpha = 1
        }
    }
    
    private func animateViewRemoveWithFade(_ view: UIView, _ animationDuration: TimeInterval, _ completion: @escaping (() -> Void)) {
        view.alpha = 1
        UIView.animate(withDuration: animationDuration, animations: {
            view.alpha = 0
        }) { _ in
            view.removeFromSuperview()
            completion()
        }
    }
}
