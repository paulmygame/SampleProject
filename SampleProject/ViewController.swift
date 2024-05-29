//
//  ViewController.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 5/13/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var mainView: HomeView = {
        let view = HomeView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var contentTable: UITableView = {
        let tbl = UITableView()
        tbl.register(CustomViewCell.self, forCellReuseIdentifier: "cellId")
        tbl.delegate = self
        tbl.dataSource = self
        tbl.separatorColor = UIColor.white
        return tbl
    }()
   
    override func viewDidLoad() {
        setupView()
    }
    
    func setupView(){
    
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.1)
            if #available(iOS 11.0, *) {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
                make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
                make.leading.equalTo(view.safeAreaLayoutGuide.snp.leadingMargin)
                make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailingMargin)
             } else {
                make.edges.equalToSuperview()
             }
        }
        
        view.addSubview(contentTable)
        contentTable.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().inset(10)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentTable.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CustomViewCell
            cell.backgroundColor = UIColor.white
            cell.dayLabel.text = "Day \(indexPath.row+1)"
            return cell
    }
    
}
