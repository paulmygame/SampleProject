//
//  ViewController.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 5/13/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
//    lazy var mainView: HomeView = {
//        let view = HomeView()
//        view.backgroundColor = .red
//        return view
//    }()
//    
//    lazy var profileView: ProfileView = {
//        let view = ProfileView()
//        view.backgroundColor = .orange
//        view.layer.masksToBounds = true
//        view.layer.cornerRadius = 50
//        view.layer.borderColor = UIColor(hex: "#000000")?.cgColor
//        view.layer.borderWidth = 1
//        return view
//    }()
//    
//    lazy var profileNameView: UIView = {
//        let view = UIView()
//        return view
//    }()
//    
//    lazy var profileNameLbl: UILabel = {
//        let lbl = UILabel()
//        lbl.text = "Paul Eduard Lapiceros"
//        lbl.textColor = .black
//        lbl.textAlignment = .center
//        lbl.font = .systemFont(ofSize: 12, weight: .bold)
//        return lbl
//    }()
//    
//    lazy var profileEditBtn: UIButton = {
//        let btn = UIButton()
//        btn.setBackgroundImage(UIImage(named: "edit_icon"), for: .normal)
//        btn.contentMode = .scaleAspectFit
//        btn.addTarget(self, action: #selector(didTapEdit), for: .touchUpInside)
//        return btn
//    }()
//    
//    lazy var contentTable: UITableView = {
//        let tbl = UITableView()
//        tbl.delegate = self
//        tbl.dataSource = self
//        tbl.separatorColor = UIColor.white
//        tbl.register(CustomViewCell.self, forCellReuseIdentifier: "cellId")
//        return tbl
//    }()
    
    override func viewDidLoad() {
        setupView()
    }
    
    func setupView(){
        
//        view.addSubview(mainView)
//        mainView.snp.makeConstraints { make in
//            make.height.equalToSuperview().multipliedBy(0.1)
//            if #available(iOS 11.0, *) {
//                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
//                make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
//                make.leading.equalTo(view.safeAreaLayoutGuide.snp.leadingMargin)
//                make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailingMargin)
//            } else {
//                make.edges.equalToSuperview()
//            }
//        }
//        
//        view.addSubview(profileView)
//        profileView.snp.makeConstraints { make in
//            make.top.equalTo(mainView.snp.bottom).offset(10)
//            make.centerX.equalToSuperview()
//            make.width.height.equalTo(100)
//        }
//        
//        view.addSubview(profileNameView)
//        profileNameView.snp.makeConstraints { make in
//            make.top.equalTo(profileView.snp.bottom)
//            make.centerX.equalToSuperview()
//            make.width.equalToSuperview().multipliedBy(0.5)
//            make.height.equalTo(30)
//        }
//        
//        profileNameView.addSubview(profileNameLbl)
//        profileNameLbl.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.left.equalToSuperview().offset(30)
//            make.height.equalTo(20)
//        }
//        
//        profileNameView.addSubview(profileEditBtn)
//        profileEditBtn.snp.makeConstraints { make in
//            make.left.equalTo(profileNameLbl.snp.right).offset(6)
//            make.centerY.equalToSuperview()
//            make.width.equalToSuperview().multipliedBy(0.1)
//            make.height.equalTo(profileNameLbl).offset(-5)
//        }
        
    }
    
    // MARK: - TableView Delegate
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 20
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CustomViewCell
//        cell.backgroundColor = UIColor.white
//        cell.dayLabel.text = "Day \(indexPath.row+1)"
//        cell.cellButton.addTarget(self, action: #selector(btnOpenCaseTapped), for: .touchUpInside)
//        return cell
//    }
//    
//    // MARK: - Local Functions
//    
//    @objc func btnOpenCaseTapped() {
//        print("Ngeeeeee")
//    }
//    
//    @objc func didTapEdit() {
//        print("Edit")
//    }
    
}
