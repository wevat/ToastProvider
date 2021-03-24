//
//  ToastConfiguration.swift
//  ToastProvider
//
//  Created by Harry Bloom on 16/08/2018.
//  Copyright © 2018 WeVat. All rights reserved.
//

import UIKit

public class ToastConfiguration {

    public var defaultSize: CGSize
    public var displayTime: TimeInterval
    public var animation: ToastViewAnimationType

    @available(iOS 13.0, *)
    public lazy var overrideUserInterfaceStyle: UIUserInterfaceStyle = .unspecified
    
    public init(defaultSize: CGSize = CGSize(width: 250, height: 250),
                displayTime: TimeInterval = 3,
                animation: ToastViewAnimationType = .verticalBlinds) {
        self.defaultSize = defaultSize
        self.displayTime = displayTime
        self.animation = animation
    }
}
