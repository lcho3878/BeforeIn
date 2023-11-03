



import UIKit
import FirebaseAuth
import SnapKit
import PhotosUI

class ProfileViewController: BaseViewController {
    
    // MARK: - Properties
    var picker: PHPickerViewController?
    let userManager = UserManager()
    let profileView = ProfileView()
    private let cellData: [String] = [
        "화면 설정",
        "비밀번호 변경",
        "로그아웃",
        "회원탈퇴",
        "앱 정보",
    ]
    
    // MARK: - Life Cycle
    override func loadView() {
        view = profileView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        profileView.profileViewModel?.updateUser(currentUser)
        profileView.updateProfileImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        profileView.profileViewModel = ProfileViewModel(user: currentUser)
        setPicker()
        setTableView()
        addTarget()
        //        configureUser()
    }
    
    
    // MARK: - Methods
    func setTableView(){
        profileView.tableView.dataSource = self
        profileView.tableView.delegate = self
        profileView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        profileView.tableView.separatorStyle = .none
    }
    
    func setPicker(){
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images
        picker = PHPickerViewController(configuration: configuration)
    }
    
    func addTarget(){
        profileView.editNicknameButton.addTarget(self, action: #selector(editNicknameButtonTapped), for: .touchUpInside)
        profileView.editProfileButton.addTarget(self, action: #selector(editProfileButtonTapped), for: .touchUpInside)
    }
    
    
    
    // MARK: - @objc
    @objc func editNicknameButtonTapped() {
        let nicknameEditVC = NicknameEditViewController()
        self.navigationController?.pushViewController(nicknameEditVC, animated: true)
    }
    
    @objc func editProfileButtonTapped(){
        if let picker = picker {
            picker.delegate = self
            present(picker, animated: true, completion: nil)
        }
        profileView.updateProfileImage()
    }
    
    
}


// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            let displayVC = DisplayViewController()
            self.navigationController?.pushViewController(displayVC, animated: true)
        } else if indexPath.row == 1 {
            // 비밀번호 변경
            let passwordEditVC = PasswordEditViewController()
            self.navigationController?.pushViewController(passwordEditVC, animated: true)
        } else if indexPath.row == 2 {
            // 로그아웃
            showAlertTwoButton(title: "로그아웃", message: "정말 로그아웃하시겠습니까?", button1Title: "확인", button2Title: "취소") {
                do {
                    try Auth.auth().signOut()
                    let loginViewController = LoginViewController()
                    self.transitionToRootView(view: UINavigationController(rootViewController: loginViewController))
                } catch let signOutError as NSError {
                    print("Error signing out: \(signOutError.localizedDescription)")
                }
            }
        } else if indexPath.row == 3 {
            let userAccountDeletionVC = UserAccountDeletionViewController()
            self.navigationController?.pushViewController(userAccountDeletionVC, animated: true)
        } else if indexPath.row == 4 {
            let appInfoVC = AppInfoViewController()
            self.navigationController?.pushViewController(appInfoVC, animated: true)
        }
    }
    
}


// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let text = cellData[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        
        let line = UIView()
//        line.backgroundColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1)
        line.backgroundColor = .systemGray5
        line.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(line)
        
        line.snp.makeConstraints { make in
            make.leading.equalTo(cell.contentView.snp.leading)
            make.trailing.equalTo(cell.contentView.snp.trailing)
            make.bottom.equalTo(cell.contentView.snp.bottom)
            make.height.equalTo(1)
        }
        
        
        let chevronImageView = UIImageView()
        chevronImageView.image = UIImage(systemName: "chevron.forward")
        chevronImageView.tintColor = .gray
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(chevronImageView)
        
        chevronImageView.snp.makeConstraints { make in
            make.width.equalTo(14)
            make.height.equalTo(22)
            make.centerY.equalTo(cell.contentView)
            make.trailing.equalTo(cell.contentView).offset(-24)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let numberOfCells = tableView.numberOfRows(inSection: indexPath.section)
        return tableView.bounds.height / CGFloat(numberOfCells)
    }
}

// MARK: - PHPickerViewControllerDelegate
extension ProfileViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        guard let selectedImage = results.first?.itemProvider, selectedImage.canLoadObject(ofClass: UIImage.self) else {
            return
        }
        selectedImage.loadObject(ofClass: UIImage.self) { [weak self] image, error in
            guard let self = self, let image = image as? UIImage, error == nil else { return }
            userManager.uploadImage(image)
            self.updateProfileImage(image)
            showAlertOneButton(title: "프로필 이미지 변경", message: "프로필 이미지가 변경되었습니다.", buttonTitle: "확인")
        }
    }
    
    func updateProfileImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.profileView.circularImageView.image = image
        }
    }
    
}
