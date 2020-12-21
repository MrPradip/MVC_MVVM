//
//  MVCViewController.swift
//  MVC_MVVM_Demo
//
//  Created by Pradeep on 21/12/20.
//

import UIKit

class MVCViewController: UIViewController {
    
    
    @IBOutlet weak var mvcTableView: UITableView!
    var datalist = [MyDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mvcTableView.register(UITableViewCell.self, forCellReuseIdentifier: "mvcCell")
        mvcTableView.dataSource = self
        mvcTableView.delegate = self
        
        fetchDataList()
        
    }
    func fetchDataList() {
        // Do network Call
        datalist = [MyDataModel(titleName: "David"),MyDataModel(titleName: "Pradeep"),MyDataModel(titleName: "Mr Kumar")]
        
    }
    
}

extension MVCViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mvcTableView.dequeueReusableCell(withIdentifier: "mvcCell", for: indexPath)
        let celldata = datalist[indexPath.row]

        cell.textLabel?.text = celldata.titleName
        return cell
    }
    
    
}

extension MVCViewController : UITableViewDelegate{}
