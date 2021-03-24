//
//  ToastView.swift
//  Pods-ToastProvider_Example
//
//  Created by Harry Bloom on 16/08/2018.
//

import UIKit

class ToastView: NibView {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let imageView = UIImageView()
    let imageContainerView = UIView()
    let stackView = UIStackView()
    
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
        setupStackView()
        addImageView()
        addTitleLabel()
        addSubtitleLabel()
        setupLabels()
        backgroundColor = .clear
        setupBackgroundView()
    }

    private func setupStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -20).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 20).isActive = true
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 12
        stackView.contentMode = .scaleToFill
    }

    private func addImageView() {
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.tintColor = UIColor.customGrey

        imageContainerView.addSubview(imageView)

        imageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor).isActive = true

        stackView.addArrangedSubview(imageContainerView)
    }

    private func addTitleLabel() {
        stackView.addArrangedSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
    }

    private func addSubtitleLabel() {
        stackView.addArrangedSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
    }

    private func setupLabels() {
        subtitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.font = UIFont.systemFont(ofSize: 23, weight: .semibold)

        [subtitleLabel, titleLabel].forEach { label in
            label.numberOfLines = 0
            label.textColor = UIColor.customGrey
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.5
            label.lineBreakMode = .byTruncatingTail
        }
    }

    private func setupBackgroundView() {
        backgroundColor = .clear
        view?.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        if #available(iOS 10.0, *) {
            blurView = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
        } else {
            blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        }
        
        insertSubview(blurView, at: 0)
        blurView.pinEdgesToSuperviewEdges()
        blurView.cornerRadius = 10
        view?.cornerRadius = 10
    }
}
