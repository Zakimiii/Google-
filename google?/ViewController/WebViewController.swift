//
//  WebViewController.swift
//  google?
//
//  Created by Apple on 2018/08/18.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webTop: NSLayoutConstraint!
    @IBOutlet weak var webRight: NSLayoutConstraint!
    @IBOutlet weak var webLeft: NSLayoutConstraint!
    @IBOutlet weak var footerRight: NSLayoutConstraint!
    @IBOutlet weak var footerBottom: NSLayoutConstraint!
    @IBOutlet weak var footerLeft: NSLayoutConstraint!
    @IBOutlet weak var googleWebView: WKWebView! {
        didSet {
            googleWebView.transform = CGAffineTransform(scaleX: -1, y: 1)
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
        let myURL = URL(string: "https://www.google.co.jp/" + self.keyword)
        let myURLRequest = URLRequest(url: myURL!)
        googleWebView.load(myURLRequest)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
