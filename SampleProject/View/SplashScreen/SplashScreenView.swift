//
//  SplashScreenView.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 7/18/26.
//

import UIKit

class SplashScreenView: UIViewController {
    
    private let logoView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "food_logo")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(logoView)
        
        logoView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalToSuperview().multipliedBy(0.1)
        }
    }
}
