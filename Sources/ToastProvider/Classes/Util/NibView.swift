//
//  NibView.swift
//  ToastProvider
//
//  Created by Harry Bloom on 16/08/2018.
//

import UIKit

class NibView: UIView {
    
    var view: UIView?
    
    init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        setupNib("\(type(of: self))")
    }
    
    func setupNib(_ nibName: String) {
        if let view = loadViewFromNib(nibName) {
            self.view = view
            self.view?.frame = bounds
            self.view?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
            addSubview(view)
        }
    }
    
    func loadViewFromNib(_ nibName: String) -> UIView? {
        let podBundle = Bundle(for: NibView.self)
        if let bundleUrl = podBundle.url(forResource: "ToastProvider", withExtension: "bundle"), let bundle = Bundle(url: bundleUrl) {
            if bundle.path(forResource: nibName, ofType: "nib") != nil {
                let nib = UINib(nibName: nibName, bundle: bundle)
                if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
                    return view
                }
            }
        }
        
        return nil
    }
}
