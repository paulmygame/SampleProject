//
//  HomeView.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 5/27/24.
//

import UIKit

class HomeView: UIViewController {
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "My Profile"
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
}

extension HomeView {
    public func setupView() {
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        
        mainView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
