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
    
    convenience init(title: String, subtitle: String?, image: UIImage?) {
        self.init()
        titleLabel.text = title
        subtitleLabel.text = subtitle
        imageView.image = image
        imageContainerView.isHidden = image == nil
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
