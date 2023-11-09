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
    
    let titleLabel = UILabel().then {
        $0.text = "에티켓숲"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tree")
        return imageView
    }()
    
    let tagCollectionViewLayout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 8
        $0.itemSize = CGSize(width: 82, height: 30)
    }

    lazy var tagCollectionView = UICollectionView(frame: .zero, collectionViewLayout: tagCollectionViewLayout).then{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    let postTableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    let plusButton = UIButton().then{
        $0.backgroundColor = .BeforeInRed?.withAlphaComponent(0.7)
        $0.layer.cornerRadius = 25
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
        addSubview(titleLabel)
        addSubview(titleImageView)
        addSubview(tagCollectionView)
        addSubview(postTableView)
        addSubview(plusButton)
    }
    
    private func setupConstraint() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(-10)
            make.leading.equalToSuperview().offset(24)
            make.height.equalTo(32)
        }
        titleImageView.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.bottom).offset(-3)
            make.leading.equalTo(titleLabel.snp.trailing).offset(3)
            make.width.height.equalTo(30)
        }
        tagCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
        postTableView.snp.makeConstraints { make in
            make.top.equalTo(tagCollectionView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(50)
        }
        plusButton.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(40)
            make.trailing.equalToSuperview().inset(16)
        }
    }
}
