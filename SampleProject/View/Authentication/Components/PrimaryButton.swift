//
//  PrimaryButton.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 7/24/26.
//

import UIKit

final class PrimaryButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PrimaryButton {
    func setupUI() {
        backgroundColor = UIColor(
            red: 255/255,
            green: 118/255,
            blue: 67/255,
            alpha: 1
        )

        setTitleColor(.white, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        layer.cornerRadius = 16
        clipsToBounds = true
        snp.makeConstraints { make in
            make.height.equalTo(56)
        }
    }
}

extension PrimaryButton {

    func setLoading(_ loading: Bool) {

        isEnabled = !loading
        alpha = loading ? 0.7 : 1.0

        if loading {

            let indicator = UIActivityIndicatorView(style: .medium)
            indicator.color = .white
            indicator.startAnimating()
            indicator.tag = 999

            addSubview(indicator)

            indicator.snp.makeConstraints {
                $0.center.equalToSuperview()
            }

            setTitle("", for: .normal)

        } else {

            viewWithTag(999)?.removeFromSuperview()

        }

    }

}
