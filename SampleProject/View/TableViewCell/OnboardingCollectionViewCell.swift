//
//  OnboardingCollectionViewCell.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 7/18/26.
//

import UIKit

final class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OnboardingCollectionViewCell"
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 28, weight: .bold)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16)
        lbl.textColor = .gray
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white

        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(300)

        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(24)

        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(36)

        }

    }
    
    func configure(with page: OnboardingModel) {
        imageView.image = UIImage(named: page.image)
        titleLabel.text = page.title
        descriptionLabel.text = page.description
        
    }
    
    
}
