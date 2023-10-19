//
//  QuizResultViewModel.swift
//  BeforeIn
//
//  Created by t2023-m0047 on 2023/10/19.
//

import Foundation

class QuizResultViewModel {

    var user: User {
        didSet{
            self.updateView?()
        }
    }
    var name: String {
        return user.name
    }
    var level: String {
        switch user.level {
        case 1: return "검은머리 짐승"
        case 2: return "훈련받은 짐승"
        case 3: return "이족보행 단계"
        case 4: return "인간"
        case 5: return "지성인"
        default: return "레벨 정보 없음"
        }
    }
    var updateView: (() -> Void)?
    
    init(user: User) {
        self.user = user
    }
    
    func updateUser(_ user: User) {
        print("view모델 user 업데이트")
        self.user = user
    }
}