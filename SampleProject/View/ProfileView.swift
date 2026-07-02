//
//  ProfileView.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 8/21/24.
//

import UIKit

class ProfileView: UIView {
    
    lazy var profView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#FAF9F6")
        return view
    }()
    
    lazy var profImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "profile_icon")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        
        addSubview(profView)
        profView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.size.equalToSuperview()
        }
        
        profView.addSubview(profImage)
        profImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.size.equalToSuperview()
        }
    }
}
