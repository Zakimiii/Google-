//
//  SearchField.swift
//  google?
//
//  Created by Apple on 2018/08/18.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

protocol SearchFieldDelegate: class {
    func tappedSearchButton(_ searchBar:SearchField,  keyword: String?)
}

extension SearchFieldDelegate where Self: UIViewController {
    func tappedSearchButton(keyword: String){}
}

@objcMembers
class SearchField: UIView {

    @IBOutlet weak var searchButton: UIButton! {
        didSet {
            searchButton.addTarget(self, action: #selector(self.onTouchUpSearchButton), for: .touchUpInside)
        }
    }
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 5
            textField.layer.borderColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1.0).cgColor
            textField.layer.masksToBounds = true
        }
    }
    weak var delegate: SearchFieldDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    private func loadNib() {
        guard let view = Bundle(for: type(of: self)).loadNibNamed("searchField", owner: self, options: nil)?.first as? UIView else {
            return
        }
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
    func onTouchUpSearchButton() {
       self.delegate?.tappedSearchButton(self,  keyword: self.textField.text)
    }
}
