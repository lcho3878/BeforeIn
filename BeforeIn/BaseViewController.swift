//
//  BaseViewController.swift
//  BeforeIn
//
//  Created by t2023-m079 on 10/11/23.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(backTapped))
    }

    // Alert
    func showAlertOneButton(title: String, message: String?, buttonTitle: String, completion: (() -> Void)? = nil) {
        
        let alertCotroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default) { _ in
            completion?()
        }
        
        alertCotroller.addAction(action)
        
        present(alertCotroller, animated: true, completion: nil)
    
    }

    func showAlertTwoButton(title: String,
                            message: String?,
                            button1Title: String,
                            button2Title: String,
                            completion1: (() -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action1 = UIAlertAction(title: button1Title, style: .default) { _ in
            completion1?()
        }
        let action2 = UIAlertAction(title: button2Title, style: .cancel)
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // 루트뷰 변경, 화면 이동
    func transitionToRootView(view: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight

        self.view.window?.layer.add(transition, forKey: kCATransition)
        self.view.window?.rootViewController = view
    }
    
    // 키보드 외 다른 영역 터치 시, 키보드 내리기
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func backTapped() {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }
    }
}
