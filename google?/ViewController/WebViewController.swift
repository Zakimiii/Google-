//
//  WebViewController.swift
//  google?
//
//  Created by Apple on 2018/08/18.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import WebKit

@objcMembers
class WebViewController: UIViewController, Animatable {
    
    enum animation: Int {
        case left
        case right
        case zoomIn
        case updown
        case reverse
        case question
        case count
    }
    @IBOutlet weak var footerView: FooterView! {
        didSet {
            footerView.delegate = self
        }
    }
    @IBOutlet weak var webTop: NSLayoutConstraint!
    @IBOutlet weak var webRight: NSLayoutConstraint!
    @IBOutlet weak var webLeft: NSLayoutConstraint!
    @IBOutlet weak var footerRight: NSLayoutConstraint!
    @IBOutlet weak var footerBottom: NSLayoutConstraint!
    @IBOutlet weak var footerLeft: NSLayoutConstraint!
    @IBOutlet weak var googleWebView: WKWebView! {
        didSet {
            googleWebView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewTapped)))
            googleWebView.uiDelegate = self
            googleWebView.navigationDelegate = self
        }
    }
    @IBOutlet weak var footerbottom: NSLayoutConstraint!
    @IBOutlet weak var footerHeight: NSLayoutConstraint!
    var keyword: String = "" {
        didSet {
            self.keyword = "search?q=\(self.keyword)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard self.keyword != nil else { return
            dismiss(animated: true, completion: nil)
        }
        let myURL = URL(string: "https://www.google.co.jp/" + self.keyword)
        guard myURL != nil else { return
            dismiss(animated: true, completion: nil)
        }
        let myURLRequest = URLRequest(url: myURL!)
        googleWebView.load(myURLRequest)
        let num = Int(arc4random() % 6)
        self.setFunc(animation.init(rawValue: num)!)
    }
    
    func viewTapped() {
        self.googleWebView.layer.removeAllAnimations()
        let num = Int(arc4random() % 6)
        self.setFunc(animation.init(rawValue: num)!)
        self.googleWebView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
    }
    
    func movelayout() {
        webTop.constant = CGFloat(arc4random() % UInt32(self.view.frame.height - 120) + 120)
        webLeft.constant = CGFloat(arc4random() % UInt32(self.view.frame.width - 120) + 120)
        webRight.constant = CGFloat(arc4random() % UInt32(self.view.frame.height - 120) + 120)
        footerBottom.constant = CGFloat(arc4random() % UInt32(self.view.frame.width - 120) + 120)
        footerbottom.constant = CGFloat(arc4random() % UInt32(self.view.frame.height - 120) + 120)
        footerLeft.constant = CGFloat(arc4random() % UInt32(self.view.frame.width - 120) + 120)
        footerRight.constant = CGFloat(arc4random() % UInt32(self.view.frame.height - 120) + 120)
        footerHeight.constant = CGFloat(arc4random() % UInt32(self.view.frame.width - 120) + 120)
    }
    
    func setFunc(_ animation:animation){
        switch animation {
        case .left:
            QuizAlertManager.sharedInstance.show(viewController: self)
            self.rotateLeft(view: self.googleWebView)
        case .right:
            QuizAlertManager.sharedInstance.show(viewController: self)
            self.rotateRight(view: self.googleWebView)
        case .zoomIn:
            QuizAlertManager.sharedInstance.show(viewController: self)
            self.zoomIn(view: self.googleWebView)
        case .updown:
            QuizAlertManager.sharedInstance.show(viewController: self)
            self.updown(view: self.googleWebView)
        case .reverse:
            QuizAlertManager.sharedInstance.show(viewController: self)
             self.googleWebView.transform = CGAffineTransform(scaleX: -1, y: 1)
        case .question:
            QuizAlertManager.sharedInstance.show(viewController: self)
        case .count: break
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
extension WebViewController: FooterViewDelegate {
    func tappedBack() {
         self.dismiss(animated: true, completion: nil)
    }
    
    func tappedNext() {
        self.googleWebView.layer.removeAllAnimations()
        self.googleWebView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
    }
    
    func tappedNew() {
        let num = Int(arc4random() % 6)
        self.keyword = ["tech camp", "google", "one ok rock", "あああああ", "aiueo", "yes I am"][num]
        let myURL = URL(string: "https://www.google.co.jp/" + self.keyword)
        guard myURL != nil else { return
            dismiss(animated: true, completion: nil)
        }
        let myURLRequest = URLRequest(url: myURL!)
        googleWebView.load(myURLRequest)
    }
    
    func tappedPlus() {
        let num = Int(arc4random() % 6)
        self.keyword = ["東京", "京都", "福岡", "bring me horizon", "you can do it", "らららら"][num]
        let myURL = URL(string: "https://www.google.co.jp/" + self.keyword)
        guard myURL != nil else { return
            dismiss(animated: true, completion: nil)
        }
        let myURLRequest = URLRequest(url: myURL!)
        googleWebView.load(myURLRequest)
    }
    
    func tappedShare() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension WebViewController: WKUIDelegate, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.googleWebView.layer.removeAllAnimations()
        let num = Int(arc4random() % 5)
        self.setFunc(animation.init(rawValue: num)!)
        self.googleWebView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
    }
}
