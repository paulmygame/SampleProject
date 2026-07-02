//
//  CustomViewCell.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 5/29/24.
//

import UIKit

class CustomViewCell: UITableViewCell {
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var dayLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 12, weight: .bold)
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    lazy var cellButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("manok", for: .normal)
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
        return btn
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.selectionStyle = .none
        self.addSubview(cellView)
        cellView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(40)
        }
        
        cellView.addSubview(dayLabel)
        dayLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.centerY.equalToSuperview()
            
        }
        
        cellView.addSubview(cellButton)
        cellButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(30)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func didTapBtn(){
        print("Ngeeeeee")
    }
}
