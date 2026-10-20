//
//  RegisterView.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 10/17/26.
//

import UIKit
import SnapKit

final class RegisterView: UIViewController {

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
        label.text = "Create Account"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Sign Up screen will be built here."
        label.font = .systemFont(ofSize: 16)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)

        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.size.equalTo(44)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-24)
            make.leading.trailing.equalToSuperview().inset(24)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(32)
        }
    }

    private func setupActions() {
        backButton.addTarget(
            self,
            action: #selector(backTapped),
            for: .touchUpInside
        )
    }

    @objc
    private func backTapped() {
        navigationController?.popViewController(animated: true)
    }
}

