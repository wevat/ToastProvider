//
//  ToastConfiguration.swift
//  ToastProvider
//
//  Created by Harry Bloom on 16/08/2018.
//  Copyright © 2018 WeVat. All rights reserved.
//

import Foundation

public class ToastConfiguration {
    
    public static let shared = ToastConfiguration()
    
    public var defaultSize: CGSize
    public var displayTime: TimeInterval
    
    private init() {
        defaultSize = CGSize(width: 250, height: 250)
        displayTime = 3
    }
}
