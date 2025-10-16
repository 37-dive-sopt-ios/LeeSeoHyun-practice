//
//  LoginViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 이서현 on 10/11/25.
//



//MARK: - command + / => 드래그한 부분 전체 주석 처리!! 진짜 궁금했던 건데!!

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    // 배달의민족 주조색 (하늘색 계열)
    let baeminSkyBlue = UIColor(red: 35/255, green: 200/255, blue: 195/255, alpha: 1.0)
    // 텍스트 필드 배경색 (약간 연한 회색)
    let textFieldBackgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
    // 텍스트 필드 테두리 색상 (더 연한 회색)
    let textFieldBorderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
    
    // MARK: - UI Components
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 60, y: 120, width: 290, height: 150))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        ///numberOfLines 를 써도 ... 이런 식으로 말줄임표가 안 사라졌음 ㅠ!
        ///width랑 height 를 충분히 주니까 된다고 헤연언니가 알려줬다!!
        
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: self.view.bounds.width - 40, height: 52))
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
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: self.view.bounds.width - 40, height: 52))
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
        let button = UIButton(frame: CGRect(x: 20, y: 422, width: self.view.bounds.width - 40, height: 57))
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
        
        components.forEach { view.addSubview($0) }
        
        
        /// setHierarchy(titleLabel)
        /// setHierarchy(subtitleLabel) 이런 식으로 하는 건데 forEach 써서 간단하게 표현함
        
    }
    
    //MARK: - 네비게이션
    
    //모달
    private func presentToWelcomeVC() {
        let vc = WelcomeViewController()
        //vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.name = emailTextField.text
        //vc.name = emailTextField.text => 타입이 안 맞음(name은 str, text는 str?)-> name을 str?로 수정함
        self.present(vc, animated: true)
    }
    
    //네비게이션
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.name = emailTextField.text
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
        if sender.value >= 0.10 && sender.value <= 0.17 { // 10/17 과제제출이니까^^..
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    
}


#Preview {
    LoginViewController()
}
