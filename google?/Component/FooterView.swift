//
//  FooterView.swift
//  google?
//
//  Created by Apple on 2018/08/18.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

protocol FooterViewDelegate: class {
    func tappedBack()
    func tappedNext()
    func tappedShare()
    func tappedPlus()
    func tappedNew()
}
extension FooterViewDelegate where Self: UIViewController {
    func tappedBack(){}
    func tappedNext(){}
    func tappedShare(){}
    func tappedPlus(){}
    func tappedNew(){}
}
@objcMembers
class FooterView: UIView {
    
    @IBOutlet weak var backButton: UIButton! {
        didSet{
            backButton.addTarget(self, action: #selector(self.onBackButton), for: .touchUpInside)
        }
    }
    @IBOutlet weak var nextButton: UIButton!{
        didSet{
            nextButton.transform = CGAffineTransform(scaleX: -1, y: 1)
            backButton.addTarget(self, action: #selector(self.onNextButton), for: .touchUpInside)
        }
    }
    @IBOutlet weak var shareButton: UIButton!{
        didSet{
            backButton.addTarget(self, action: #selector(self.onShareButton), for: .touchUpInside)
        }
    }
    @IBOutlet weak var plusButton: UIButton!{
        didSet{
            backButton.addTarget(self, action: #selector(self.onPlusButton), for: .touchUpInside)
        }
    }
    @IBOutlet weak var newButton: UIButton!{
        didSet{
            backButton.addTarget(self, action: #selector(self.onNewButton), for: .touchUpInside)
        }
    }
    var delegate: FooterViewDelegate!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    private func loadNib() {
        guard let view = Bundle(for: type(of: self)).loadNibNamed("FooterView", owner: self, options: nil)?.first as? UIView else {
            return
        }
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func onBackButton(){
        self.delegate?.tappedBack()
    }
    func onNextButton(){
        self.delegate?.tappedNext()
    }
    func onShareButton() {
        self.delegate?.tappedShare()
    }
    func onPlusButton() {
        self.delegate?.tappedPlus()
    }
    func onNewButton() {
        self.delegate?.tappedNew()
    }
}
