//
//  LoginView.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 7/23/26.
//

import UIKit

class LoginView: UIViewController {
    
    // MARK: - ScrollView

    private let scrollView = UIScrollView()

    private let contentView = UIView()
     // MARK: - Components

    private let headerView = AuthHeaderView()

    private let emailField = AuthTextField()

    private let passwordField = PasswordTextField()

    private let rememberMeView = CheckboxView(
        title: "Remember Me"
    )

    private let forgotPasswordButton: UIButton = {

        let button = UIButton(type: .system)
        button.setTitle("Forgot Password", for: .normal)
        button.titleLabel?.font = .systemFont(
            ofSize: 14,
            weight: .medium
        )
        button.setTitleColor(
            AppColor.primary,
            for: .normal
        )
        return button

    }()

    private let loginButton = PrimaryButton(
        title: "LOG IN"
    )

    private let signUpLabel = UILabel()

    private let facebookButton = SocialButton(image: UIImage(named: "facebook"))

    private let googleButton = SocialButton(image: UIImage(named: "google"))

    private let appleButton = SocialButton(image: UIImage(named: "apple"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureViews()
        setupConstraints()
    }
}

extension LoginView {
    func setupUI() {
        
    }
}

extension LoginView {
    func configureViews() {
        
    }
}

extension LoginView {
    func setupConstraints() {
        
    }
}
