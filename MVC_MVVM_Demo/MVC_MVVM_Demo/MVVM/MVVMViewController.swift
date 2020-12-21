//
//  MVVMViewController.swift
//  MVC_MVVM_Demo
//
//  Created by Pradeep on 21/12/20.
//

import UIKit

class MVVMViewController: UIViewController {
    
    
    @IBOutlet weak var mvvmTableView: UITableView!
    var datalist = [MyDataModel]()
    
    var myViewModel = MyViewModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mvvmTableView.register(UITableViewCell.self, forCellReuseIdentifier: "mvvmCell")
        mvvmTableView.dataSource = self
        mvvmTableView.delegate = self
        
        fetchDataList()
        
    }
    
    func fetchDataList() {
        // Do network Call
        myViewModel.fetchDataList(completion: { [weak self]_ in
            self?.mvvmTableView.reloadData()
        })
        
    }
    

}

extension MVVMViewController : UITableViewDelegate{}

extension MVVMViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myViewModel.datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mvvmTableView.dequeueReusableCell(withIdentifier: "mvvmCell", for: indexPath)
        let celldata = myViewModel.datalist[indexPath.row]

        cell.textLabel?.text = celldata.titleName
        return cell
    }
    
    
}


