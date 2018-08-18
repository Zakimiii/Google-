//
//  QuizAlertManager.swift
//  google?
//
//  Created by 井上 龍一 on 2018/08/18.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class QuizAlertManager {
    static let sharedInstance = QuizAlertManager()
    private let plist: Dictionary<String, Any>!
    
    private init() {
        if let urls = Bundle.main.path(forResource: "Quiz", ofType:"plist" ) {
            plist = NSDictionary(contentsOfFile: urls) as! Dictionary<String, Any>
        } else {
            plist = nil
        }
    }
    
    func show(viewController: UIViewController) {
        if arc4random_uniform(10) < 5 {
            return
        }
        
        let index: Int = Int(arc4random_uniform(UInt32(plist.count)))
        let quiz = Array(plist.keys)[index]
        let selects = plist[quiz]! as! Dictionary<String, Bool>
        
        let actions = selects.map { (select, isCorrect) -> UIAlertAction in
            UIAlertAction(title: select, style: .default, handler:{ (action: UIAlertAction!) -> Void in
                isCorrect ? self.showCorrectAlert(viewController: viewController) : self.showIncorrectAlert(viewController: viewController)
            })
        }

        let alert: UIAlertController = UIAlertController(title: "突然ですがここで問題です！", message: quiz, preferredStyle: .alert)
        actions.forEach { (action) in
            alert.addAction(action)
        }
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    private func showCorrectAlert(viewController: UIViewController){
        let alert: UIAlertController = UIAlertController(title: "正解です！", message: "間違えてくれた方が面白かったのに", preferredStyle: .alert)
        
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler:{
            (action: UIAlertAction!) -> Void in
        })
        
        alert.addAction(defaultAction)
        viewController.present(alert, animated: true, completion: nil)
    }
    
    private func showIncorrectAlert(viewController: UIViewController){
        let alert: UIAlertController = UIAlertController(title: "不正解です！", message: "m9(^Д^)ﾌﾟｷﾞｬｰ", preferredStyle: .alert)
        
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler:{
            (action: UIAlertAction!) -> Void in
        })
        
        alert.addAction(defaultAction)
        viewController.present(alert, animated: true, completion: nil)
    }
}
