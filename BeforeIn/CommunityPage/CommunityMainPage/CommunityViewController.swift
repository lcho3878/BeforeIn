


import UIKit
import SnapKit
import FirebaseFirestore
import FirebaseAuth


//더미 데이터
let user1 = User(email: "", name: "", nickname: "lcho3878", profileImage: "", level: 1, phone: "")
let user2 = User(email: "", name: "", nickname: "cksgh0910", profileImage: "", level: 1, phone: "")

class CommunityViewController: UIViewController {
    
    let communityMainView = CommunityView()
    var postTableView: UITableView!
    private var handle: AuthStateDidChangeListenerHandle?
    let userManager = UserManager()
    
    var posts: [Post] = []
    var count = 0
    
    var selectedCategory = "전체보기"
    var postsListener: ListenerRegistration?
    var categoryCollectionView: UICollectionView!
    var postCategories: [String] = ["전체보기", "일상잡담", "궁금해요"]
    var filteredPostList: [Post] = []
    var blockListCount: Int?
    
    override func loadView() {
        view = communityMainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if blockListCount != currentUser.blockList.count {
            postsListener?.remove()
            fetchPosts()
            blockListCount = currentUser.blockList.count
        }
//        setPlaceholder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blockListCount = currentUser.blockList.count
        collectionViewSetting()
        communityMainView.plusButton.addTarget(self, action: #selector(plusButtonClick), for: .touchUpInside)
        fetchPosts()
    }
    
    
    func setPlaceholder() {
        if posts.isEmpty {
            communityMainView.placeholderLabel.isHidden = false
        } else {
            communityMainView.placeholderLabel.isHidden = true
        }
    }
    
    @objc func plusButtonClick() {
        let writeVC = WriteViewController()
        self.navigationController?.pushViewController(writeVC, animated: true)
    }
    
    func collectionViewSetting() {
        communityMainView.tagCollectionView.dataSource = self
        communityMainView.tagCollectionView.delegate = self
        communityMainView.tagCollectionView.register(TagCell.self, forCellWithReuseIdentifier: "TagCell")
        postTableView = communityMainView.postTableView
        communityMainView.tagCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .top)
        collectionView(communityMainView.tagCollectionView, didSelectItemAt: IndexPath(item: 0, section: 0))
        communityMainView.postTableView.dataSource = self
        communityMainView.postTableView.delegate = self
        communityMainView.postTableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
    }
    
}


// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension CommunityViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as? TagCell else {
            return UICollectionViewCell()
        }
        cell.tagLabel.text = postCategories[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategory = postCategories[indexPath.row]
        self.selectedCategory = selectedCategory
        updateFilteredPostList(selectedCategory)
        print(filteredPostList.count)
        
    }
    
    func updateFilteredPostList(_ selectedCategory: String) {
        if selectedCategory == "전체보기" {
            filteredPostList = posts
        }
        else {
            filteredPostList = posts.filter{ $0.category == selectedCategory }
        }
        self.postTableView.reloadData()
    }
    
    
    func fetchPosts() {
        print(#function)
        let db = Firestore.firestore()
        self.posts = []
        postsListener = db.collection("Post").addSnapshotListener { (snapshot, error) in
            if error == nil && snapshot != nil {
                var blockedEmails = currentUser.blockList
                let dispatchGroup = DispatchGroup()
                // 변화가 있는것만 가져올 수 있다.
                for change in snapshot!.documentChanges {
                    // change type remove, modified 일때도 로직 추가 예정
                    if change.type == .added {
                        self.communityMainView.indicator.startAnimating()
                        let addDoc = db.collection("Post").document(change.document.documentID).getDocument { (snapshot, error) in
                            if error == nil && snapshot != nil && snapshot?.data() != nil {
                                let data = snapshot!.data()!
                                let writer = data["writer"] as! String
                                if !blockedEmails.contains(writer) {
                                    dispatchGroup.enter()
                                    // 차단되지 않은 사용자의 글만 처리
                                    let category = data["category"] as! String
                                    let content = data["content"] as! String
                                    let likes = data["likes"] as! Int
                                    let postingTime = data["postingTime"] as! Timestamp
                                    let postingID = data["postingID"] as! String
                                    var title = data["title"] as! String
                                    var writerNickName = "로딩 실패"
                                    let writerRef = data["writerNickName"] as? DocumentReference
                                    if let writerRef = writerRef {
                                        writerRef.getDocument{ (wrterSnapshot, error) in
                                            if error == nil && wrterSnapshot != nil && wrterSnapshot!.exists {
                                                let writerData = wrterSnapshot!.data()
                                                if let nick = writerData?["nickname"] as? String {
                                                    writerNickName = nick
                                                }
                                            }
                                            else {
                                                writerNickName = "탈퇴한 회원입니다."
                                            }
                                            dispatchGroup.leave()
                                        }

                                    }
                                    var comments: [Comment] = []
                                    if let commentsData = data["comments"] as? [[String: Any]] {
                                        for comment in commentsData {
                                            if let commentWriter = comment["writer"] as? String,
                                               let commentPostingTime = comment["postingTime"] as? Timestamp,
                                               var commentContent = comment["content"] as? String,
                                               let commentWriterNickName = comment["writerNickName"] as? String{
                                                let newComment = Comment(writer: commentWriter, writerNickName: commentWriterNickName, content: commentContent, postingTime: commentPostingTime.dateValue(), reportUserList: [])
                                                comments.append(newComment)
                                            }
                                        }
                                    }
                                    var reportUserList: [String] = []
                                    let reportedData = data["reportUserList"] as? [String]
                                    if let reportedData = reportedData {
                                        for email in reportedData {
                                            reportUserList.append(email)
                                        }
                                    }
                                    if reportUserList.count >= 3 {
                                        //                                    print("차단글 발견")
                                        title = "다수의 신고에 의해 삭제된 게시글입니다."
                                    }
                                    dispatchGroup.notify(queue: .main) {
                                        let addPost = Post(writer: writer, writerNickName: writerNickName, postID: postingID, title: title, content: content, comments: comments, likes: likes, category: category, postingTime: postingTime.dateValue(), reportUserList: reportUserList)
                                        print(addPost.title, " 제목의 글이 추가됨")
                                        self.posts.append(addPost)
                                    }

                                }
                                dispatchGroup.notify(queue: .main) {
                                    self.posts.sort{$0.postingTime > $1.postingTime}
                                    self.updateFilteredPostList(self.selectedCategory)
                                    self.communityMainView.indicator.stopAnimating()
                                    self.setPlaceholder()
                                }


                            }
                        }
                    } else if change.type == .removed {
                        for i in 0..<self.posts.count {
                            if self.posts[i].postID == change.document.documentID {
                                self.posts.remove(at: i)
                                break
                            }
                        }
                        self.updateFilteredPostList(self.selectedCategory)
                        self.setPlaceholder()
                    } else {
                        dispatchGroup.enter()
                        let modifyDoc = db.collection("Post").document(change.document.documentID).getDocument { (snapshot, error) in
                            if error == nil && snapshot != nil && snapshot?.data() != nil {
                                let data = snapshot!.data()!
                                let category = data["category"] as! String
                                let likes = data["likes"] as! Int
                                let postingTime = data["postingTime"] as! Timestamp
                                let postingID = data["postingID"] as! String
                                let writer = data["writer"] as! String
                                var writerNickName = "로딩 실패"
                                let writerRef = data["writerNickName"] as? DocumentReference
                                if let writerRef = writerRef {
                                    writerRef.getDocument{ (wrterSnapshot, error) in
                                        if error == nil && wrterSnapshot != nil && wrterSnapshot!.exists {
                                            let writerData = wrterSnapshot!.data()
                                            if let nick = writerData?["nickname"] as? String {
                                                writerNickName = nick
                                                
                                            }
                                        }
                                        else {
                                            writerNickName = "탈퇴한 회원입니다."
                                        }
                                        dispatchGroup.leave()
                                    }
                                    
                                }
                                var comments: [Comment] = []
                                if let commentsData = data["comments"] as? [[String: Any]] {
                                    for comment in commentsData {
                                        if let commentWriter = comment["writer"] as? String,
                                           let commentPostingTime = comment["postingTime"] as? Timestamp,
                                           var commentContent = comment["content"] as? String,
                                           let commentWriterNickName = comment["writerNickName"] as? String{
                                            let newComment = Comment(writer: commentWriter, writerNickName: commentWriterNickName, content: commentContent, postingTime: commentPostingTime.dateValue(), reportUserList: [])
                                            comments.append(newComment)
                                        }
                                    }
                                }
                                var reportUserList: [String] = []
                                let reportedData = data["reportUserList"] as? [String]
                                if let reportedData = reportedData {
                                    for email in reportedData {
                                        reportUserList.append(email)
                                    }
                                }
                                var title = data["title"] as! String
                                var content = data["content"] as! String
                                if reportUserList.count >= 3 {
                                    title = "다수의 신고에 의해 삭제된 게시글입니다."
                                }
                                
                                dispatchGroup.notify(queue: .main) {
                                    let modifyPost = Post(writer: writer, writerNickName: writerNickName, postID: postingID, title: title, content: content, comments: comments, likes: likes, category: category, postingTime: postingTime.dateValue(), reportUserList: reportUserList)
                                    for i in 0..<self.posts.count {
                                        if self.posts[i].postID == change.document.documentID {
                                            self.posts[i] = modifyPost
                                            break
                                        }
                                    }
                                    self.updateFilteredPostList(self.selectedCategory)
                                }
                            }
                        }
                    }
                }
            } else {
                // error
            }
        }
    }
}



// MARK: - UITableViewDataSource, UITableViewDelegate
extension CommunityViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredPostList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        let post = filteredPostList[indexPath.row]
        cell.configureUI(post)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = filteredPostList[indexPath.row]
        
        let communityPageVC = CommunityPageViewController()
        communityPageVC.post = post
        self.navigationController?.pushViewController(communityPageVC, animated: true)
    }
}
