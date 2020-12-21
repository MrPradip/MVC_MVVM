//
//  MyViewModel.swift
//  MVC_MVVM_Demo
//
//  Created by Pradeep on 21/12/20.
//

import Foundation

class MyViewModal {
    
   var datalist = [MyDataModel(titleName: "David"),MyDataModel(titleName: "Pradeep"),MyDataModel(titleName: "Mr Kumar")]
    
    func fetchDataList(completion: @escaping (Result<[MyDataModel],Error>) -> Void){
        completion(.success(datalist))
    }
    
}
