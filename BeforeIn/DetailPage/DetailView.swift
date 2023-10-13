//
//  DetailView.swift
//  BeforeIn
//
//  Created by t2023-m0048 on 2023/10/13.
//

import UIKit
import SnapKit
import Then

class DetailView: UIView {
    
    // MARK: - Properties
    private let firstDetailView = FirstDetailView()
    private let secondDetailView = SecondDetailView()
    private let thirdDetailView = ThirdDetailView()
    
    // MARK: - UI Properties
    let scrollView = UIScrollView().then {
        $0.alwaysBounceVertical = true
    }
    let contentView = UIView()
    
    
    // MARK: - Life Cycle
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addSubview() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(firstDetailView)
        contentView.addSubview(secondDetailView)
        contentView.addSubview(thirdDetailView)
    }
    
    
    func setUI() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.top.bottom.left.right.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        firstDetailView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(scrollView.snp.height)
        }
        
        secondDetailView.snp.makeConstraints {
            $0.top.equalTo(firstDetailView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(scrollView.snp.height)
        }
        
        thirdDetailView.snp.makeConstraints {
            $0.top.equalTo(secondDetailView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(scrollView.snp.height)
            $0.bottom.equalTo(scrollView.snp.bottom).offset(-10)
        }
    }
    
    
}
