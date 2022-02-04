//
//  Service.swift
//  Pokemon
//
//  Created by norelhoda on 30.01.2022.
//

import Foundation
import Alamofire
import ProgressHUD

class Services {
    
    static let shared  = Services()
    
    //MARK:- API for  fetch list of charchters
    
    public func getCharchterList(url:URL,successCompletion: @escaping ((_ json : CharacterListModel) -> Void)){
        
         ProgressHUD.show()
        
        Alamofire.request(url).responseData { response in
            switch response.result {
            case .success( _):
                let json = response.data
                    let decoder = JSONDecoder()
                   
                    do {
                       
                        let usersList: CharacterListModel = try decoder.decode(CharacterListModel.self, from: json!)
                        successCompletion(usersList)
                        ProgressHUD.dismiss()
                        break
                     }
                         catch {
                            ProgressHUD.dismiss()
                            break
                       
                    }
            case .failure(let error):
                print(error.localizedDescription)
                ProgressHUD.dismiss()
                break
            }
        }
     }
    //MARK:- API for  fetch charchter details data
    
    public func getCharachterDetails(parms: URL ,successCompletion: @escaping ((_ json : CharchterDetailsModel) -> Void)){
        
         ProgressHUD.show()
        Alamofire.request(parms).responseData { response in
            switch response.result {
            case .success( _):
                let json = response.data
                    let decoder = JSONDecoder()
                   
                    do {
                       
                        let usersList: CharchterDetailsModel = try decoder.decode(CharchterDetailsModel.self, from: json!)
                        successCompletion(usersList)
                        ProgressHUD.dismiss()
                        break
                     }
                         catch {
                            ProgressHUD.dismiss()
                            break
                       
                    }
            case .failure(let error):
                print(error.localizedDescription)
                ProgressHUD.dismiss()
                break
            }
        }
     }
}

