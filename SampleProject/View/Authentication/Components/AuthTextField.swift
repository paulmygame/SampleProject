//
//  AuthTextField.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 7/23/26.
//

import UIKit

class AuthTextField: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .medium)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 244/255,
                                       green: 247/255,
                                       blue: 252/255,
                                       alpha: 1)
        view.layer.cornerRadius = 12
        return view
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 15)
        tf.borderStyle = .none
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.textColor = .black
        return tf
    }()
    
    private let leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AuthTextField {
    
    func setupUI() {
        addSubview(titleLabel)
        addSubview(containerView)

        containerView.addSubview(leftImageView)
        containerView.addSubview(textField)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }

        containerView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(54)

        }

        leftImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.centerY.equalToSuperview()
            make.size.equalTo(20)

        }

        textField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(leftImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
}

extension AuthTextField {
    
    func configure(title: String, placeholder: String, icon: UIImage? = nil) {
        titleLabel.text = title
        textField.placeholder = placeholder
        if let icon {
            leftImageView.isHidden = false
            leftImageView.image = icon
        } else {
            leftImageView.isHidden = true
            textField.snp.remakeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.leading.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)

            }
        }
    }
}
