//
//  PrivacyPolicyViewController.swift
//  BeforeIn
//
//  Created by Sanghun K. on 10/31/23.
//

import UIKit
import SnapKit
import WebKit

class PrivacyPolicyViewController: BaseViewController, WKNavigationDelegate {
    // MARK: - Properties
    private let webView = WKWebView().then {
        $0.backgroundColor = .systemBackground
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
       
        webView.navigationDelegate = self
   
        if let url = URL(string: "https://chalk-fir-f36.notion.site/0c87ef13ab9d45a28dfefe5bff44982d?pvs=4") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        configureUI()
    }
    
    // MARK: - Methods
    private func configureUI() {
        // addSubView
        view.addSubview(webView)
        
        // makeConstraints
        webView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
