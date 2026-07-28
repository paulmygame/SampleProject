//
//  CheckboxView.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 7/24/26.
//

import UIKit

final class CheckboxView: UIControl {
    
    private(set) var isChecked = false
    
    private let checkBoxView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.backgroundColor = .clear
        return view
    }()
    
    private let checkmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .darkGray
        return label
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CheckboxView {

    func setupUI() {

        addSubview(checkBoxView)
        checkBoxView.addSubview(checkmarkImageView)
        addSubview(titleLabel)

    }

    func setupConstraints() {

        checkBoxView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.size.equalTo(22)
        }

        checkmarkImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(12)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(checkBoxView.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
            make.centerY.equalTo(checkBoxView)
        }

    }

}

private extension CheckboxView {
    @objc func toggleCheckbox() {

        isChecked.toggle()
        UIView.animate(withDuration: 0.2) {

            if self.isChecked {

                self.checkBoxView.backgroundColor = UIColor(
                    red: 255/255,
                    green: 118/255,
                    blue: 67/255,
                    alpha: 1
                )

                self.checkBoxView.layer.borderColor = UIColor.clear.cgColor
                self.checkmarkImageView.isHidden = false

            } else {

                self.checkBoxView.backgroundColor = .clear
                self.checkBoxView.layer.borderColor = UIColor.lightGray.cgColor
                self.checkmarkImageView.isHidden = true

            }

        }

        sendActions(for: .valueChanged)

    }
    
    func setChecked(_ checked: Bool) {

        guard checked != isChecked else { return }

        isChecked = checked

        checkBoxView.backgroundColor = checked
        ? UIColor(
            red: 255/255,
            green: 118/255,
            blue: 67/255,
            alpha: 1
        )
        : .clear

        checkBoxView.layer.borderColor = checked ? UIColor.clear.cgColor : UIColor.lightGray.cgColor
        checkmarkImageView.isHidden = !checked

    }
    
}
