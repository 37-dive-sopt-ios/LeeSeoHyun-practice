//
//  WelcomeViewController_Delegate.swift
//  sopt-37th-01Seminar
//
//  Created by 이서현 on 10/18/25.
//


import UIKit

protocol WelcomeReloginDelegate: AnyObject {
    func retryLogin(didTapReloginWith message: String)
}


final class WelcomeViewController_Delegate: UIViewController {
    
    internal var name: String?
    
    weak var delegate: WelcomeReloginDelegate? // s. 선언만 해줌 
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "rabbit")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
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
    
    private var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인하기", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        
        // s. 여길 델리게이트.self로 가야 된다
        button.addTarget(WelcomeViewController_Delegate.self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
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
            welcomeLabel,
            goHomeButton,
            backToLoginButton
        ].forEach {
            //$0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        // s. 파트원이 없으면 호출이 되지 않는 것임 -> delegate?
        delegate?.retryLogin(didTapReloginWith: "재로그인 버튼을 누르셨어요")
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    

    private func bindID() {
        //guard let name = name else { return }
        self.welcomeLabel.text = "\(name ?? "")님 \n반가워요!"
    }
    
    func setLabelText(name: String?) {
        self.name = name
    }
}

#Preview {
    WelcomeViewController()
}
