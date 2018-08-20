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
    
    convenience init(title: String, subtitle: String?) {
        self.init()
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
