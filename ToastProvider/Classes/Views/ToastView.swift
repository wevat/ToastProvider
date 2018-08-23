//
//  ToastView.swift
//  Pods-ToastProvider_Example
//
//  Created by Harry Bloom on 16/08/2018.
//

import UIKit

class ToastView: NibView {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageContainerView: UIView!
    
    var blurView: UIVisualEffectView!
    
    convenience init(title: String, subtitle: String?, image: UIImage?) {
        self.init()
        titleLabel.text = title
        subtitleLabel.text = subtitle
        imageView.image = image
        imageContainerView.isHidden = image == nil
    }
    
    override init() {
        super.init()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .clear
        setupBackgroundView()
    }
    
    private func setupBackgroundView() {
        backgroundColor = .clear
        if #available(iOS 10.0, *) {
            blurView = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
        } else {
            blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        }
        
        insertSubview(blurView, at: 0)
        blurView.pinEdgesToSuperviewEdges()
        blurView.cornerRadius = 10
    }
}
