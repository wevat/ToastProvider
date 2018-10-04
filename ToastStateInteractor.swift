//
//  ToastStateInteractor.swift
//  ToastProvider
//
//  Created by Harry Bloom on 04/10/2018.
//

import Foundation

class ToastStateInteractor {
    
    private static var toastQueue = {
        return DispatchQueue(label: "toast_queue")
    }()
    
    static func nextToastToShow(callback: @escaping ((_ window: ToastWindow?) -> Void)) {
        toastQueue.async {
            callback(ToastState.shared.queue.first)
        }
    }
    
    static func addToQueue(toast: ToastWindow) {
        toastQueue.async {
            ToastState.shared.queue.append(toast)
        }
    }
    
    static func removeLastToast(completion: @escaping (() -> Void)) {
        toastQueue.async {
            guard ToastState.shared.queue.last != nil else {
                completion()
                return
            }
            ToastState.shared.queue.removeFirst()
            completion()
        }
    }
    
    static func isCurrentlyShowingToast(callback: @escaping ((_ isShowing: Bool) -> Void)) {
        toastQueue.async {
            callback(ToastState.shared.isShowingToast)
        }
    }
    
    static func toggleIsShowing(_ isShowing: Bool) {
        toastQueue.async {
            ToastState.shared.isShowingToast = isShowing
        }
    }
}
