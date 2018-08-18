//
//  Animatable.swift
//  google?
//
//  Created by 井上 龍一 on 2018/08/18.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

protocol Animatable {
    func updown(view: UIView, gain: CGFloat)
    func rotateRight(view: UIView, speed: TimeInterval)
    func rotateLeft(view: UIView, speed: TimeInterval)
    func zoomIn(view: UIView, speed: TimeInterval)
}

extension Animatable {
    func updown(view: UIView, gain: CGFloat = 100.0) {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.autoreverse, .repeat], animations: {
            view.center.y += gain
        }, completion: nil)
    }

    func rotateRight(view: UIView, speed: TimeInterval = 1.0) {
        UIView.animate(withDuration: speed, delay: 0.0, options: [.repeat, .curveLinear], animations: {
            view.transform = view.transform.rotated(by: CGFloat(Float.pi))
        }, completion: nil)
    }
    
    func rotateLeft(view: UIView, speed: TimeInterval = 1.0) {
        UIView.animate(withDuration: speed, delay: 0.0, options: [.repeat, .curveLinear], animations: {
            view.transform = view.transform.rotated(by: CGFloat(-Float.pi))
        }, completion: nil)
    }
    
    func zoomIn(view: UIView, speed: TimeInterval = 100.0) {
        UIView.animate(withDuration: speed, delay: 0.0, options: [.repeat, .curveLinear], animations: {
            view.frame = CGRect(x:10, y:10, width:10, height:10)
        })
    }
}
