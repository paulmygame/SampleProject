//
//  PasswordTextField.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 7/23/26.
//

import UIKit

final class PasswordTextField: AuthTextField {
    
    private var isPasswordVisible = false
    
    private lazy var eyeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "eye.slash"),for: .normal)
        button.tintColor = .gray
        button.addTarget(
            self,
            action: #selector(togglePassword),
            for: .touchUpInside
        )
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPasswordUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 
extension PasswordTextField {
    func setupPasswordUI() {
        textField.isSecureTextEntry = true
        containerView.addSubview(eyeButton)

        eyeButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-14)
            make.centerY.equalToSuperview()
            make.size.equalTo(22)
        }

        textField.snp.remakeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.bottom.equalToSuperview()
            make.trailing.equalTo(eyeButton.snp.leading).offset(-12)
        }
    }
}

private extension PasswordTextField {

    @objc func togglePassword() {
        let currentText = textField.text
        let selectedRange = textField.selectedTextRange

        isPasswordVisible.toggle()
        textField.isSecureTextEntry = !isPasswordVisible

        eyeButton.setImage(
            UIImage(
                systemName: isPasswordVisible ? "eye" : "eye.slash"
            ),
            for: .normal
        )

        textField.text = currentText

        if let selectedRange {
            textField.selectedTextRange = selectedRange
        }
    }

}

extension PasswordTextField {

    func configure(title: String, placeholder: String) {
        super.configure(title: title, placeholder: placeholder)
        textField.isSecureTextEntry = true
    }

}
