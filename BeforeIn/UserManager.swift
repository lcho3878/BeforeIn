//
//  UserManager.swift
//  BeforeIn
//
//  Created by t2023-m0048 on 2023/10/18.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


struct UserManager {
    let db = Firestore.firestore()
    
    // 생성할때는 기본이미지로 생성(이미지 URL저장), 마이페이지에서 수정하면 업데이트
    func addUser(user: User) {
        db.collection("User").addDocument(data: [
            "email": user.email,
            "name": user.name,
            "nickname": user.nickname,
            "profileImage": user.profileImage,
            "level": user.level,
            "phone": user.phone
        ])
    }
    
    func deleteUser(user: FirebaseAuth.User){
        if let email = user.email {
            db.collection("User").whereField("email", isEqualTo: email).getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error.localizedDescription)")
                    return
                }
                for document in querySnapshot!.documents {
                    document.reference.delete()
                }
            }
        }
    }
    
    func findUser(email: String, completion: @escaping (Bool) -> Void) {
        let userDB = db.collection("User")
        let query = userDB.whereField("email", isEqualTo: email)
        query.getDocuments { (snapShot, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(true) // 사용 불가능, 에러 처리 필요
            } else if let qs = snapShot, qs.documents.isEmpty {
                completion(false) // 사용 가능
            } else {
                completion(true) // 사용 불가능
            }
        }
    }
    
}