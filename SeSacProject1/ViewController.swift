//
//  ViewController.swift
//  SeSacProject1
//
//  Created by t2023-m0032 on 5/29/24.
//

import UIKit
var list: [String] = []
/*
 1.tableview 아웃렛 선언
 2.tableview 부하직원 선언 : protocol
 3.table와 부하직원 연결 : 타입으로서의 protocol
 4.XIB Cell: 여러 테이블에 재사용
 5.XIB register 해야함
 */


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var mainView: UIView!
    @IBOutlet var uiView: UIView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let xib = UINib(nibName: "AddTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "AddTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        mainView.backgroundColor = .yellow
        uiView.backgroundColor = .systemMint
        tableView.backgroundColor = .yellow
        
        textField.backgroundColor = .orange
        addButton.backgroundColor = .orange
        addButton.setTitle("추가", for: .normal)
        
        let randomButton = UIBarButtonItem(title: "숫자 랜덤", style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        //navigation에 임베드되어있어야함
        navigationItem.rightBarButtonItem = randomButton
        
    }

    @objc func rightBarButtonItemClicked() {
        let random = Int.random(in: 0...100)
        list.append("랜덤 숫자 \(random)를 추가했어요")
        tableView.reloadData()
        print(#function)
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if textField.text!.count > 0 {
            list.append(textField.text!)
            textField.text = ""
            tableView.reloadData() // *
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddTableViewCell") as! AddTableViewCell
        
//        if textField.text!.count > 0 {
//            cell.resultLabel.text = list[indexPath.row]
//            textField.text = ""
//        }
        
        cell.resultLabel.text = list[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        tableView.reloadData()
    }
   
    
    
}

