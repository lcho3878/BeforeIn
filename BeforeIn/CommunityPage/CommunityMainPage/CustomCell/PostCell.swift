//
//  PostCell.swift
//  BeforeIn
//
//  Created by t2023-m079 on 10/21/23.
//

import UIKit
import SnapKit
import Then

class PostCell: UITableViewCell {

    private let postView = UIView().then{
        $0.backgroundColor = .systemBackground
    }
    
    private let titleLable = UILabel().then{
        $0.text = "요즘 애들은 지하철 노약자석에 그냥 앉아 있나요?"
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.numberOfLines = 0
    }
    
    private let categoryButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setTitleColor(UIColor.darkGray, for: .normal)
        $0.backgroundColor = UIColor.systemGray6
        $0.layer.cornerRadius = 5
        $0.contentEdgeInsets = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 6)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
    }
    
    private let nickNameLabel = UILabel().then{
        $0.text = "닉네임 • "
        $0.textColor = .systemGray
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    private let postingTimeLabel = UILabel().then{
        $0.text = "1일 전"
        $0.textColor = .systemGray
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
//    private let heartImageView = UIImageView().then{
//        $0.image = UIImage(systemName: "heart")
//        $0.tintColor = .black
//    }
//
//    private let heartsLabel = UILabel().then{
//        $0.text = "1"
//        $0.font = UIFont.systemFont(ofSize: 12)
//    }
    
    private let commentImageView = UIImageView().then{
        $0.image = UIImage(systemName: "text.bubble")
        $0.tintColor = .SystemBlack
    }
    
    private let commentsLabel = UILabel().then{
        $0.text = "13"
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupUI() {
        addSubview(postView)
        postView.addSubview(titleLable)
        postView.addSubview(categoryButton)
        postView.addSubview(nickNameLabel)
        postView.addSubview(postingTimeLabel)
//        postView.addSubview(heartImageView)
//        postView.addSubview(heartsLabel)
        postView.addSubview(commentImageView)
        postView.addSubview(commentsLabel)
        
        postView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(6)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        titleLable.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-50)
            make.top.equalToSuperview().inset(8)
//            make.width.equalTo(329)
//            make.height.equalTo(44)
        }
        
        categoryButton.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.top)
            make.trailing.equalToSuperview().offset(5)
        }
        
        nickNameLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(10)
            make.leading.equalToSuperview()
        }
        
        postingTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(10)
            make.leading.equalTo(nickNameLabel.snp.trailing)
        }
        
//        heartImageView.snp.makeConstraints { make in
//            make.width.height.equalTo(16)
//            make.top.equalTo(nickNameLabel.snp.bottom).offset(15)
//            make.leading.equalToSuperview()
//        }
//
//        heartsLabel.snp.makeConstraints { make in
//            make.centerY.equalTo(heartImageView)
//            make.leading.equalTo(heartImageView.snp.trailing).offset(6)
//        }
        
        commentImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(10)
            make.width.height.equalTo(14)
            make.trailing.equalTo(commentsLabel.snp.leading).offset(-4)
        }
        
        commentsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(commentImageView)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func configureUI(_ post: Post) {
        titleLable.text = post.title
        nickNameLabel.text = "\(post.writerNickName) • "
        postingTimeLabel.text = post.postingTime.getTimeText()
       // heartsLabel.text = String(post.likes)
        commentsLabel.text = String(post.comments.count)
        categoryButton.setTitle(String(post.category), for: .normal)
    }

}
