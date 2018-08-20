//
//  ToastWindow.swift
//  ToastProvider
//
//  Created by Harry Bloom on 16/08/2018.
//

import UIKit

class ToastWindow: UIWindow {
    
    var toastView: UIView!
    
    convenience init(view: UIView) {
        self.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 250, height: 250)))
        self.toastView = view
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
        
        animateAddView()
    }
    
    func removeAndMakeInvisible() {
        animateRemoveView()
    }
    
    private func animateAddView() {
        addView(view: toastView)
        toastView.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.toastView.alpha = 1
        }
    }
    
    private func animateRemoveView() {
        toastView.alpha = 1
        UIView.animate(withDuration: 0.5, animations: {
            self.toastView.alpha = 0
        }) { _ in
            self.toastView.removeFromSuperview()
            self.isHidden = true
            self.resignKey()
        }
    }
    
    private func addView(view: UIView) {
        guard subviews.contains(view) == false else {
            return
        }
        addSubview(view)
        view.widthAnchor.constraint(equalToConstant: ToastConfiguration.shared.defaultSize.width).isActive = true
        view.heightAnchor.constraint(equalToConstant: ToastConfiguration.shared.defaultSize.height).isActive = true
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    
    private func setup() {
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        windowLevel = UIWindowLevelAlert + 1
        toastView.translatesAutoresizingMaskIntoConstraints = false
    }
}
