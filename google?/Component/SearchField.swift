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
    func shouldReturn(_ text: String?)
}

extension SearchFieldDelegate where Self: UIViewController {
    func tappedSearchButton(_ searchBar: SearchField,keyword: String?){}
    func shouldReturn(_ text: String?){}
}

@objcMembers
class SearchField: UIView {

    @IBOutlet weak var searchButton: UIButton! {
        didSet {
            searchButton.addTarget(self, action: #selector(self.onTouchUpSearchButton), for: .touchUpInside)
        }
    }
    @IBOutlet weak var textField: UITextField! {
        didSet{
            textField.delegate = self
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
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1.0).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowColor = UIColor(red: 0.54, green: 0.62, blue: 1.00, alpha: 0.50).cgColor
        view.layer.masksToBounds = true
    }
    
    
    func onTouchUpSearchButton() {
        guard self.textField.text != nil, self.textField.text != "" else {
            return
        }
       self.delegate?.tappedSearchButton(self,  keyword: self.textField.text)
    }
}
extension SearchField: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.delegate?.shouldReturn(textField.text)
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       self.delegate?.shouldReturn(textField.text)
        return true
    }
}
