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
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = "Or"
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private let lineLeft: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray5
        return view
    }()

    private let lineRight: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray5
        return view
    }()
    
    private lazy var socialStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            facebookButton,
            googleButton,
            appleButton
        ])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fillEqually
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureViews()
        setupConstraints()
    }
}

extension LoginView {
    func setupUI() {
        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(headerView)
        contentView.addSubview(emailField)
        contentView.addSubview(passwordField)

        contentView.addSubview(rememberMeView)
        contentView.addSubview(forgotPasswordButton)

        contentView.addSubview(loginButton)
        contentView.addSubview(signUpLabel)

        contentView.addSubview(orLabel)
        contentView.addSubview(lineLeft)
        contentView.addSubview(lineRight)

        contentView.addSubview(socialStackView)

    }
}

extension LoginView {
    func configureViews() {
        headerView.configure(
            title: "Log In",
            subtitle: "Please sign in to your existing account"
        )

        emailField.configure(
            title: "EMAIL",
            placeholder: "example@gmail.com"
        )

        passwordField.configure(
            title: "PASSWORD",
            placeholder: "••••••••"
        )

        let attributed = NSMutableAttributedString(
            string: "Don't have an account? ",
            attributes: [
                .foregroundColor: UIColor.gray,
                .font: UIFont.systemFont(ofSize: 15)
            ]
        )

        attributed.append(
            NSAttributedString(
                string: "SIGN UP",
                attributes: [
                    .foregroundColor: AppColor.primary,
                    .font: UIFont.boldSystemFont(ofSize: 15)
                ]
            )
        )

        signUpLabel.attributedText = attributed
        signUpLabel.textAlignment = .center
        signUpLabel.isUserInteractionEnabled = true
        
    }

}

extension LoginView {
    func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
        }
        
        // MARK: - Header

        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(260)
        }

        // MARK: - Email

        emailField.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(24)
        }

        // MARK: - Password

        passwordField.snp.makeConstraints {
            $0.top.equalTo(emailField.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(emailField)
        }

        // MARK: - Remember Me

        rememberMeView.snp.makeConstraints {
            $0.top.equalTo(passwordField.snp.bottom).offset(18)
            $0.leading.equalTo(emailField)
        }

        // MARK: - Forgot Password

        forgotPasswordButton.snp.makeConstraints {
            $0.centerY.equalTo(rememberMeView)
            $0.trailing.equalTo(emailField)
        }

        // MARK: - Login Button

        loginButton.snp.makeConstraints {
            $0.top.equalTo(rememberMeView.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(emailField)
        }

        // MARK: - Sign Up

        signUpLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }

        // MARK: - OR

        orLabel.snp.makeConstraints {
            $0.top.equalTo(signUpLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }

        lineLeft.snp.makeConstraints {
            $0.centerY.equalTo(orLabel)
            $0.leading.equalTo(emailField)
            $0.trailing.equalTo(orLabel.snp.leading).offset(-12)
            $0.height.equalTo(1)
        }

        lineRight.snp.makeConstraints {
            $0.centerY.equalTo(orLabel)
            $0.leading.equalTo(orLabel.snp.trailing).offset(12)
            $0.trailing.equalTo(emailField)
            $0.height.equalTo(1)

        }

        // MARK: - Social Buttons

        socialStackView.snp.makeConstraints {
            $0.top.equalTo(orLabel.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(64)
            $0.width.equalTo(232)
            $0.bottom.equalToSuperview().offset(-40)
        }
    }
}
