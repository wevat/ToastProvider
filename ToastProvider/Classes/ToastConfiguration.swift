//
//  ToastConfiguration.swift
//  ToastProvider
//
//  Created by Harry Bloom on 16/08/2018.
//  Copyright © 2018 WeVat. All rights reserved.
//

import Foundation

public class ToastConfiguration {
    
    static let shared = ToastConfiguration()
    
    var defaultSize: CGSize
    var displayTime: TimeInterval
    
    private init() {
        defaultSize = CGSize(width: 200, height: 200)
        displayTime = 3
    }
}
