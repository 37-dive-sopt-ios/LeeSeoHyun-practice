//
//  LoginViewController_Closure.swift
//  sopt-37th-01Seminar
//
//  Created by 이서현 on 10/18/25.
//

import UIKit
import SnapKit

class LoginViewController_Closure: UIViewController {
    
    // MARK: - Properties
    
    // 배달의민족 주조색 (하늘색 계열)
    let baeminSkyBlue = UIColor(red: 35/255, green: 200/255, blue: 195/255, alpha: 1.0)
    // 텍스트 필드 배경색 (약간 연한 회색)
    let textFieldBackgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
    // 텍스트 필드 테두리 색상 (더 연한 회색)
    let textFieldBorderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
    
    // MARK: - UI Components
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        ///numberOfLines 를 써도 ... 이런 식으로 말줄임표가 안 사라졌음 ㅠ!
        ///width랑 height 를 충분히 주니까 된다고 헤연언니가 알려줬다!!
        
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.borderStyle = .none // 기본 borderStyle 제거
        textField.backgroundColor = UIColor(named: "gray200") // 연한 회색 배경
        textField.layer.cornerRadius = 3
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor // 더 연한 테두리
        // 텍스트 필드 좌우 패딩 추가
        textField.addLeftPadding()
        textField.addRightPadding()
        textField.clearButtonMode = .whileEditing //텍스트 입력 중에만 X버튼이 보임
        /// q. 왜 textField.rightViewMode = .always 로 하면 clearButton이 안 보일까?
        /// a. clearButton 들어갈 자리에 rightView가 들어가서 덮어버린다!
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.borderStyle = .none // 기본 borderStyle 제거
        textField.isSecureTextEntry = true
        textField.backgroundColor = UIColor(named: "gray200")
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor // 더 연한 테두리
        // 텍스트 필드 좌우 패딩 추가
        textField.addLeftPadding()
        textField.addRightPadding()
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = UIColor(named: "primary_orange")// 당근 컬러
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - 슬라이더
    lazy var slider: UISlider = {
        let orangeSlider = UISlider(frame: CGRect(x:0, y:0, width:100, height:20))
        

        orangeSlider.layer.position = CGPoint(x:200, y:500)
        
        orangeSlider.minimumValue = 0
        orangeSlider.maximumValue = 1

        orangeSlider.value = 0.5
        orangeSlider.maximumTrackTintColor = UIColor(named: "gray200")

        orangeSlider.minimumTrackTintColor = UIColor(named: "primary_orange")
        orangeSlider.addTarget(self, action: #selector(onChangeValueSlider(sender:)), for: .valueChanged)
 
        return orangeSlider
        
        
        
    }()
   
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() { ///loadView 하고 나서..
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        let components = [
            titleLabel,
            emailTextField,
            passwordTextField,
            loginButton,
            slider
            
        ]
        
        components.forEach {
            // s. snapkit 쓸 땐 안 써도 됨 (내부에 구현되어 있음)
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(163)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(338)
            $0.height.equalTo(58)
        }
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 72),
            emailTextField.widthAnchor.constraint(equalToConstant: 335),
            emailTextField.heightAnchor.constraint(equalToConstant: 52),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            passwordTextField.widthAnchor.constraint(equalToConstant: 335),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    //MARK: - 네비게이션
    
    //모달
    private func presentToWelcomeVC() {
        let vc = WelcomeViewController_Closure()
        vc.modalTransitionStyle = .crossDissolve
        vc.name = emailTextField.text
        
        vc.completionHandler = { [weak self] message in
            
            guard let self = self else { return }
            /// Optional인 self를 안전하게 언래핑 (weak self 라서)

            
            self.titleLabel.text = message
            self.emailTextField.text = ""
            self.passwordTextField.text = ""
            loginButton.setTitle("다시 로그인", for: .normal)
        }
        
        self.present(vc, animated: true)
    }
    
    
    //네비게이션
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.name = emailTextField.text
        welcomeViewController.completionHandler = { [weak self] message in
            
            guard let self = self else { return }
            
            self.titleLabel.text = message
            self.emailTextField.text = ""
            self.passwordTextField.text = ""
            loginButton.setTitle("다시 로그인", for: .normal)
        }
        
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func loginButtonDidTap() {
        //        presentToWelcomeVC()
        pushToWelcomeVC() /// 동시에 실행되면 안 되니까 주석처리 해놓기~
    }
    
    
    //MARK: - 슬라이더 값이 바뀔 때마다 호출되는 메서드
    @objc
    func onChangeValueSlider(sender: UISlider) {
        print("Slide: \(sender.value)")
        if sender.value >= 0.10 && sender.value <= 0.17 { 
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
    }
}

#Preview {
    LoginViewController()
}

