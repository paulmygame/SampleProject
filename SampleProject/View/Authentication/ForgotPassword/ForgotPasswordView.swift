//
//  ForgotPasswordView.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 10/17/26.
//

import UIKit
import SnapKit

final class ForgotPasswordView: UIViewController {

    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(
            UIImage(systemName: "chevron.left"),
            for: .normal
        )
        button.tintColor = .label
        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Forgot Password?"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your email address and we'll help you reset your password."
        label.font = .systemFont(ofSize: 15)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let emailField = AuthTextField()

    private let sendCodeButton = PrimaryButton(
        title: "SEND CODE"
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureViews()
        setupActions()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(emailField)
        view.addSubview(sendCodeButton)

        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.size.equalTo(44)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(24)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(32)
        }

        emailField.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(24)
        }

        sendCodeButton.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(28)
            make.leading.trailing.equalTo(emailField)
        }
    }

    private func configureViews() {
        emailField.configure(
            title: "EMAIL",
            placeholder: "example@gmail.com",
            icon: UIImage(systemName: "envelope")
        )
    }

    private func setupActions() {
        backButton.addTarget(
            self,
            action: #selector(backTapped),
            for: .touchUpInside
        )

        sendCodeButton.addTarget(
            self,
            action: #selector(sendCodeTapped),
            for: .touchUpInside
        )
    }

    @objc
    private func backTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc
    private func sendCodeTapped() {
        // TODO: Add email validation and verification navigation.
        print("Send Code tapped")
    }
}
