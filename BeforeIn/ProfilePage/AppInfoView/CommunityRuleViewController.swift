//
//  CommunityRuleViewController.swift
//  BeforeIn
//
//  Created by t2023-m0048 on 2023/11/11.
//

import UIKit
import SnapKit
import WebKit
import NVActivityIndicatorView

class CommunityRuleViewController: BaseViewController, WKNavigationDelegate {
    // MARK: - Properties
    private let webView = WKWebView().then {
        $0.backgroundColor = .systemBackground
    }
    
    private let indicator = NVActivityIndicatorView(frame: CGRect(x: 162, y: 100, width: 50, height: 50),
                                            type: .lineSpinFadeLoader,
                                            color: .BeforeInRed,
                                            padding: 0)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        webView.navigationDelegate = self
   
        if let url = URL(string:
                            "https://www.notion.so/0a6d0dfe868f47438a180b3cb013ce79") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        configureUI()

    }
    
    // MARK: - Methods
    private func configureUI() {
        // addSubView
        view.addSubview(webView)
        view.addSubview(indicator)
        
        // makeConstraints
        webView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        indicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        indicator.startAnimating()
    }
        
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
    
}
