//
//  TopViewController.swift
//  google?
//
//  Created by Apple on 2018/08/18.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var searchField: SearchField! {
        didSet {
            searchField.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func pushWebView(_ keyword: String?) {
        guard keyword != nil else {
            return
        }
        self.performSegue(withIdentifier:"ToWebView", sender: nil)
    }
    
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToWebView" {
            guard let webViewController = segue.destination as? WebViewController else {
                return
            }
            webViewController.keyword = self.searchField.textField.text!
            return
        }
    }
}
extension TopViewController: SearchFieldDelegate {
    func tappedSearchButton(_ searchBar: SearchField, keyword: String?) {
        self.pushWebView(keyword)
    }
}
