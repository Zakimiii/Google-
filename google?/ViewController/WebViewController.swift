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
    @IBOutlet weak var googleWebView: WKWebView!
    var keyword: String 
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: "https://www.google.co.jp/search?q=\(self.keyword)")
        let myURLRequest = URLRequest(url: myURL!)
        googleWebView.load(myURLRequest)
    }
}
