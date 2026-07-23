//
//  AuthHeaderView.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 7/23/26.
//

import UIKit

final class AuthHeaderView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor.white.withAlphaComponent(0.75)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let topLeftCircle: UIView = {
        let view = UIView()
        return view
    }()
    
    private let topRightCircle: UIView = {
        let view = UIView()
        return view
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

private extension AuthHeaderView {
    
    func setupUI() {
        backgroundColor = UIColor(
            red: 22/255,
            green: 22/255,
            blue: 42/255,
            alpha: 1
        )

        layer.cornerRadius = 36
        layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]

        addSubview(topLeftCircle)
        addSubview(topRightCircle)

        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    func setupConstraints() {
        topLeftCircle.snp.makeConstraints { make in
            make.width.height.equalTo(180)
            make.left.equalTo(-90)
            make.top.equalTo(-90)
        }

        topRightCircle.snp.makeConstraints { make in
            make.width.height.equalTo(140)
            make.right.equalTo(70)
            make.top.equalTo(-60)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(subtitleLabel.snp.top).offset(-12)
        }

        subtitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
}

extension AuthHeaderView {
    func configure(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
