//
//  CommunityView.swift
//  BeforeIn
//
//  Created by t2023-m079 on 10/21/23.
//

import UIKit
import SnapKit
import Then

class CommunityView: UIView {
    
    let tagCollectionViewLayout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 8
        $0.itemSize = CGSize(width: 115, height: 32)
    }
    

    lazy var tagCollectionView = UICollectionView(frame: .zero, collectionViewLayout: tagCollectionViewLayout).then{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
    }
    
    let postTableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
    }
    
    
    
    let plusButton = UIButton().then{
        $0.backgroundColor = UIColor(red: 255/255, green: 129/255, blue: 129/255, alpha: 1.0)
        $0.layer.cornerRadius = 35
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        addSubview(tagCollectionView)
        addSubview(postTableView)
        addSubview(plusButton)
    }
    
    private func setupConstraint() {
        tagCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
        postTableView.snp.makeConstraints { make in
            make.top.equalTo(tagCollectionView.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(50)
        }
        plusButton.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(40)
            make.trailing.equalToSuperview().inset(16)
        }
    }
}
