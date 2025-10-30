//
//  WelcomeViewController_Closure.swift
//  sopt-37th-01Seminar
//
//  Created by 이서현 on 10/18/25.
//

//MARK: - autolayout
//TODO: - name -> id , EmailTextField -> idTextField로 수정하기
import UIKit

final class WelcomeViewController_Closure: UIViewController {
    
    var name: String?
    
    //s. 타입에일리어스로 간소화??
    // String을 갖고 어떠한 행동에 담기 위해 클로저를 생성
    var completionHandler: ((String) -> Void)? /// 이것도 함수임
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "rabbit")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님 \n반가워요!"
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        return button
    }()
    
    private var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        
        /// s. WelcomeViewController.self 로 하면 붕어빵 틀이랑 연결을 한 것과 같다..!!
        /// 나는 팥붕(WelcomeViewController_Closure()) 먹을 테야...
        /// 그래서 self로 해줘야 함!!
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
        
        bindID()
    }
    
    private func setLayout() {
        [
            logoImageView,
            titleLabel,
            goHomeButton,
            loginButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 163)])

        ///titleLabel 기준으로 높이 설정해도 되고, 폰 화면(View) 기준으로 높이 설정해도 됨
        ///오토레이아웃 설정 방법은 여러 가지다!! 
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 217),
            //loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 338),
            loginButton.heightAnchor.constraint(equalToConstant: 58)
                                    ])
        
    }
    

    private func bindID() {
        //guard let name = name else { return }
        self.titleLabel.text = "\(name ?? "")님 \n반가워요!"
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        _ = name ?? "알 수 없는 사용자"
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    func setLabelText(name: String?) {
        self.name = name
    }
}

#Preview {
    WelcomeViewController_Closure()
}
