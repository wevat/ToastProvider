//
//  ToastViewAnimator.swift
//  ToastProvider
//
//  Created by Harry Bloom on 23/08/2018.
//

import UIKit

public protocol ToastViewAnimator: class {
    
    var constraintCache: NSLayoutConstraint? { get set }
    
    func addViewWithAnimation(view: UIView, animationDuration: TimeInterval, animationType: ToastViewAnimationType)
    func removeViewWithAnimation(view: UIView, animationDuration: TimeInterval, animationType: ToastViewAnimationType, completion: @escaping (() -> Void))

    var configuration: ToastConfiguration { get }
}

public extension ToastViewAnimator where Self: UIView {
    
    func addViewWithAnimation(view: UIView, animationDuration: TimeInterval, animationType: ToastViewAnimationType) {
        
        switch animationType {
        case .alphaFade:
            addView(view: view)
            animateViewAddWithFade(view, animationDuration)
        case .verticalBlinds:
            addView(view: view, addDefaultConstraints: false)
            animateViewAddWithBlinds(view, animationDuration)
        default:
            addView(view: view)
        }
        
    }
    
    func removeViewWithAnimation(view: UIView, animationDuration: TimeInterval, animationType: ToastViewAnimationType, completion: @escaping (() -> Void)) {
        switch animationType {
        case .alphaFade:
            animateViewRemoveWithFade(view, animationDuration, completion)
        case .verticalBlinds:
            animateViewRemoveWithBlinds(view, animationDuration, completion)
        default:
            break
        }
    }
    
    private func addView(view: UIView, addDefaultConstraints: Bool = true) {
        guard subviews.contains(view) == false else {
            return
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        guard addDefaultConstraints == true else {
            return
        }
        addConstraints(to: view)
    }
    
    private func addConstraints(to view: UIView) {
        view.widthAnchor.constraint(equalToConstant: configuration.defaultSize.width).isActive = true
        view.heightAnchor.constraint(equalToConstant: configuration.defaultSize.height).isActive = true
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

//MARK: Fade animations
public extension ToastViewAnimator where Self: UIView {

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

//MARK: Vertical blinds animations
public extension ToastViewAnimator where Self: UIView {
    
    private func animateViewAddWithBlinds(_ view: UIView, _ animationDuration: TimeInterval) {
        view.widthAnchor.constraint(equalToConstant: configuration.defaultSize.width).isActive = true
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        view.layoutIfNeeded()
        constraintCache = view.heightAnchor.constraint(equalToConstant: configuration.defaultSize.height)
        constraintCache?.isActive = true
        
        UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.1, options: .curveLinear, animations: {
            view.layoutIfNeeded()
        }, completion: nil)
    }
    
    private func animateViewRemoveWithBlinds(_ view: UIView, _ animationDuration: TimeInterval, _ completion: @escaping (() -> Void)) {
        
        performPreBounceAnimation(view) {
            
            self.constraintCache?.constant = 0
            
            UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: .curveLinear, animations: {
                view.layoutIfNeeded()
            }) { (_) in
                view.removeFromSuperview()
                completion()
            }
        }
    }
    
    private func performPreBounceAnimation(_ view: UIView, _ completion: @escaping (() -> Void)) {
        constraintCache?.constant = 270
        
        UIView.animate(withDuration: 0.12, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            view.layoutIfNeeded()
        }) { _ in
            completion()
        }
    }
}
