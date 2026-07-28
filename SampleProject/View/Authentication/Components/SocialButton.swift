//
//  SocialButton.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 7/28/26.
//

import UIKit

class SocialButton: UIControl {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(image: UIImage?) {
        super.init(frame: .zero)
        
        setupUI()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SocialButton {
    func setupUI() {
        addSubview(containerView)
        containerView.addSubview(imageView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(64)
            make.width.equalTo(64)
        }

        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(28)
        }
    }
    
    func configure(image: UIImage?) {

        imageView.image = image

    }
}

extension SocialButton {
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.15) {
                self.transform = self.isHighlighted
                    ? CGAffineTransform(scaleX: 0.95, y: 0.95)
                    : .identity
            }
        }
    }
    
}
