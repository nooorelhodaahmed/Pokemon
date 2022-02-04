//
//  MainViewModel.swift
//  Pokemon
//
//  Created by norelhoda on 30.01.2022.
//

import Foundation
import UIKit

class MainViewModel {

    //MARK:- Proporties
    
    var data : [Results]?{
        didSet{
            reloadTableView?()
        }
    }
    
    var reloadTableView :(()->())?
    
    //MARK:- fetch charchtersList data
    
    func fetchlistData() {
        Services.shared.getCharchterList(url: URL(string: EndPiont.CahrchtersListUrl)!) { success in
            if success.count != 0 {
                self.data = success.results!
            }else{return}
        }
    }
    
    //MARK:- configure Selected viewController
    
    func setSelectedViewController(url:String,name:String) -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = (storyboard.instantiateViewController(withIdentifier: "DetailsController") as! DetailsController)
        viewController.modalPresentationStyle = .fullScreen
        viewController.url = url
        viewController.name = name
        return viewController
    }
}
