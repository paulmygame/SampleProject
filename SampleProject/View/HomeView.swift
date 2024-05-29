//
//  HomeView.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 5/27/24.
//

import UIKit

class HomeView: UIView {
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "PornHub"
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeView {
    public func setupView() {
        addSubview(mainView)
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
