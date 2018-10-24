//
//  ToastQueue.swift
//  ToastProvider
//
//  Created by Harry Bloom on 04/10/2018.
//

import Foundation

class ToastState {
    
    static let shared = ToastState()
    
    var isShowingToast: Bool
    var queue: [ToastDisplayConfig] {
        didSet {
            print("Toast queue length is \(queue.count)")
        }
    }
    
    private init() {
        isShowingToast = false
        queue = []
    }    
}
