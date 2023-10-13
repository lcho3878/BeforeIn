//
//  SearchView.swift
//  BeforeIn
//
//  Created by Sanghun K. on 10/13/23.
//

import UIKit

class SearchView: UIView {

    // MARK: - UI Properties
    lazy var searchTextField = UITextField().then {
        $0.placeholder = "검색어를 입력하세요"
        $0.borderStyle = .none
        $0.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.addLeftPadding(8)
        $0.rightView = searchButtonContainer
        $0.rightViewMode = .unlessEditing
    }
    
    lazy var searchButton = UIButton().then{
        $0.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        $0.tintColor = .gray
    }
    
    lazy var searchButtonContainer = UIView().then {
        $0.addSubview(searchButton)
        searchButton.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8))
        }
    }
    
    lazy var cancelButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .none
    }
    
    lazy var categoryStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .leading
        $0.distribution = .fill
    }
    
    let scrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    
    let divider = UIView().then {
        $0.backgroundColor = UIColor(red: 0.946, green: 0.946, blue: 0.946, alpha: 1)
    }
    
    let etiquetteTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
//        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0)
    }
    // MARK: - Life Cycle
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    func addSubview(){
        scrollView.addSubview(categoryStackView)
        
        addSubview(searchTextField)
        addSubview(cancelButton)
        addSubview(scrollView)
        addSubview(divider)
        addSubview(etiquetteTableView)
    }
    
    func configureUI() {
        
        // makeConstraints
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20) // TODO: top 60을 어디를 기준으로 잡아야할지..
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalTo(cancelButton.snp.leading).offset(-16)
            $0.height.equalTo(50)
        }
        
        cancelButton.snp.makeConstraints {
            $0.centerY.equalTo(searchTextField)
            $0.trailing.equalToSuperview().offset(-24)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(35)
        }
        
        categoryStackView.snp.makeConstraints {
            $0.top.leading.trailing.height.centerY.equalTo(scrollView)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(categoryStackView.snp.bottom).offset(16)
            $0.height.equalTo(3)
            $0.width.equalToSuperview()
        }
        
        etiquetteTableView.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
