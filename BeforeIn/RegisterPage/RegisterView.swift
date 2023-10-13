//
//  RegisterView.swift
//  BeforeIn
//
//  Created by t2023-m0048 on 2023/10/12.
//

import UIKit
import SnapKit
import Then


class RegisterView: UIView {
    
    // MARK: - UI Properties
    lazy var registerIdLabel = UILabel().then {
        $0.text = "아이디"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    lazy var registerIdTextField = UITextField().then {
        $0.placeholder = "아이디를 입력하세요."
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.keyboardType = .emailAddress
        $0.clearsOnBeginEditing = false
    }
    
    lazy var registerIdBottom = UIView().then {
        $0.backgroundColor = .systemGray2
    }
    
    lazy var registerPwLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    lazy var registerPwTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력하세요."
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.isSecureTextEntry = true
        $0.clearsOnBeginEditing = false
    }
    
    lazy var registerPwBottom = UIView().then {
        $0.backgroundColor = .systemGray2
    }
    
    lazy var showPwButton = UIButton().then {
        $0.setImage(UIImage(systemName: "eye"), for: .normal)
        $0.tintColor = .black
    }
    
    lazy var registerCheckLabel = UILabel().then {
        $0.text = "비밀번호 확인"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    lazy var registerCheckTextField = UITextField().then {
        $0.placeholder = "비밀번호를 다시 입력하세요."
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.isSecureTextEntry = true
        $0.clearsOnBeginEditing = false
    }
    
    lazy var registerCheckBottom = UIView().then {
        $0.backgroundColor = .systemGray2
    }
    
    lazy var showCheckButton = UIButton().then {
        $0.setImage(UIImage(systemName: "eye"), for: .normal)
        $0.tintColor = .black
    }
    
    lazy var registerNameLabel = UILabel().then {
        $0.text = "이름"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    lazy var registerNameTextField = UITextField().then {
        $0.placeholder = "실명을 입력하세요."
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.clearsOnBeginEditing = false
    }
    
    lazy var registerNameBottom = UIView().then {
        $0.backgroundColor = .systemGray2
    }
    
    lazy var registerBirthLabel = UILabel().then {
        $0.text = "생년월일"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    lazy var registerBirthTextField = UITextField().then {
        $0.placeholder = "생년월일 8자리를 입력하세요. (예: 990101)"
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.clearsOnBeginEditing = false
    }
    
    lazy var registerBirthBottom = UIView().then {
        $0.backgroundColor = .systemGray2
    }
    
    lazy var registerButton = UIButton().then {
        $0.setTitle("비포인 시작하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        $0.backgroundColor = .BeforeInRed
        $0.layer.cornerRadius = 8
    }
    
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
    
    
    // MARK: - Methods
    func addSubview(){
        addSubview(registerIdLabel)
        addSubview(registerIdTextField)
        addSubview(registerIdBottom)
        
        addSubview(registerPwLabel)
        addSubview(registerPwTextField)
        addSubview(registerPwBottom)
        addSubview(showPwButton)
        
        addSubview(registerCheckLabel)
        addSubview(registerCheckTextField)
        addSubview(registerCheckBottom)
        addSubview(showCheckButton)
        
        addSubview(registerNameLabel)
        addSubview(registerNameTextField)
        addSubview(registerNameBottom)
        
        addSubview(registerBirthLabel)
        addSubview(registerBirthTextField)
        addSubview(registerBirthBottom)
        
        addSubview(registerButton)
    }
    
    func setUI(){
        registerIdLabel.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(125)
            $0.left.equalTo(self.snp.left).offset(24)
        }
        registerIdTextField.snp.makeConstraints {
            $0.top.equalTo(registerIdLabel.snp.bottom).offset(17)
            $0.left.equalTo(self.snp.left).offset(24)
            $0.right.equalTo(self.snp.right).offset(-24)
        }
        registerIdBottom.snp.makeConstraints {
            $0.left.right.equalTo(registerIdTextField)
            $0.bottom.equalTo(registerIdTextField.snp.bottom).offset(4)
            $0.height.equalTo(1)
        }
        
        registerPwLabel.snp.makeConstraints {
            $0.top.equalTo(registerIdBottom.snp.bottom).offset(40)
            $0.left.equalTo(self.snp.left).offset(24)
        }
        registerPwTextField.snp.makeConstraints {
            $0.top.equalTo(registerPwLabel.snp.bottom).offset(17)
            $0.left.equalTo(self.snp.left).offset(24)
            $0.right.equalTo(self.snp.right).offset(-24)
        }
        registerPwBottom.snp.makeConstraints {
            $0.left.right.equalTo(registerPwTextField)
            $0.bottom.equalTo(registerPwTextField.snp.bottom).offset(4)
            $0.height.equalTo(1)
        }
        showPwButton.snp.makeConstraints{
            $0.top.equalTo(registerPwLabel.snp.bottom).offset(17)
            $0.right.equalTo(self.snp.right).offset(-30)
        }
        
        registerCheckLabel.snp.makeConstraints {
            $0.top.equalTo(registerPwBottom.snp.bottom).offset(40)
            $0.left.equalTo(self.snp.left).offset(24)
        }
        registerCheckTextField.snp.makeConstraints {
            $0.top.equalTo(registerCheckLabel.snp.bottom).offset(17)
            $0.left.equalTo(self.snp.left).offset(24)
            $0.right.equalTo(self.snp.right).offset(-24)
        }
        registerCheckBottom.snp.makeConstraints {
            $0.left.right.equalTo(registerCheckTextField)
            $0.bottom.equalTo(registerCheckTextField.snp.bottom).offset(4)
            $0.height.equalTo(1)
        }
        showCheckButton.snp.makeConstraints{
            $0.top.equalTo(registerCheckLabel.snp.bottom).offset(17)
            $0.right.equalTo(self.snp.right).offset(-30)
        }
        
        
        registerNameLabel.snp.makeConstraints {
            $0.top.equalTo(registerCheckBottom.snp.bottom).offset(40)
            $0.left.equalTo(self.snp.left).offset(24)
        }
        registerNameTextField.snp.makeConstraints {
            $0.top.equalTo(registerNameLabel.snp.bottom).offset(17)
            $0.left.equalTo(self.snp.left).offset(24)
            $0.right.equalTo(self.snp.right).offset(-24)
        }
        registerNameBottom.snp.makeConstraints {
            $0.left.right.equalTo(registerNameTextField)
            $0.bottom.equalTo(registerNameTextField.snp.bottom).offset(4)
            $0.height.equalTo(1)
        }
        
        registerBirthLabel.snp.makeConstraints {
            $0.top.equalTo(registerNameBottom.snp.bottom).offset(40)
            $0.left.equalTo(self.snp.left).offset(24)
        }
        registerBirthTextField.snp.makeConstraints {
            $0.top.equalTo(registerBirthLabel.snp.bottom).offset(17)
            $0.left.equalTo(self.snp.left).offset(24)
            $0.right.equalTo(self.snp.right).offset(-24)
        }
        registerBirthBottom.snp.makeConstraints {
            $0.left.right.equalTo(registerBirthTextField)
            $0.bottom.equalTo(registerBirthTextField.snp.bottom).offset(4)
            $0.height.equalTo(1)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(registerBirthBottom.snp.bottom).offset(64)
            $0.left.right.equalTo(self.safeAreaLayoutGuide).inset(24)
            $0.height.equalTo(50)
        }
        
    }
    
    
    
}