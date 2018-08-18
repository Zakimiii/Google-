//
//  TopViewController.swift
//  google?
//
//  Created by Apple on 2018/08/18.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

@objcMembers
class TopViewController: UIViewController, Animatable {

    @IBOutlet weak var googleTop: NSLayoutConstraint!
    @IBOutlet weak var googleImage: NSLayoutConstraint!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var searchField: SearchField! {
        didSet {
            searchField.delegate = self
        }
    }
    var labelText: String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func pushWebView(_ keyword: String?) {
        guard keyword != nil else {
            return
        }
        self.performSegue(withIdentifier:"ToWebView", sender: nil)
    }
    
    func moveComment(_ sender: Timer){
        let commentLabel = sender.userInfo as! UILabel
        commentLabel.frame.origin.x -= commentLabel.frame.height
    }
    
    func makeCommentLabel() -> UILabel {
        let label = UILabel()
        if let unwrappedLabelText = labelText{
            label.text = unwrappedLabelText
        } else {
            label.text = "いええええええええい！"
        }
        let randY = CGFloat(arc4random() % UInt32(self.view.frame.height - 64) + 64)
        label.frame.origin = CGPoint(x: self.view.frame.width, y: randY)
        label.font = UIFont(name: "HiraginoSans-W6", size: CGFloat(arc4random() % 21 + 20))
        label.sizeToFit()
        return label
    }
    
    func movelayout() {
        googleTop.constant = CGFloat(arc4random() % UInt32(self.view.frame.height - 120) + 120)
        googleImage.constant = CGFloat(arc4random() % UInt32(self.view.frame.width - 120) + 120)
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
    
    func shouldReturn(_ text: String?) {
        self.movelayout()
        self.labelText = text
        let commentLabel = makeCommentLabel()
        self.view.addSubview(commentLabel)
        Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(self.moveComment(_:)),
            userInfo: commentLabel,
            repeats: true
        )
    }
}
