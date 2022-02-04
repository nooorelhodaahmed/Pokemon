//
//  ViewController.swift
//  Pokemon
//
//  Created by norelhoda on 30.01.2022.
//

import UIKit
import FirebaseRemoteConfig
import Firebase

class MainController: UIViewController {

    //MARK:- Proporties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nvigationView: UIView!
    @IBOutlet weak var headerTitle: UILabel!
    lazy var viewModel: MainViewModel = {
         return MainViewModel()
    }()
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        initView()
        initViewModel()
    }
    
    //MARK:- intiateView

    func initView() {
        headerTitle.text = "Charchters".localized()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MainViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.separatorColor = .clear
        fetchValues()
    }
    
    //MARK:- viewModelBinding
    
    func initViewModel(){
        
        viewModel.fetchlistData()
        viewModel.reloadTableView =  { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    //MARK:- FireBase cremote config
    
    func fetchValues() {
        let defaults:[String:NSObject] =
            ["show_navigation_view": false as NSObject]
        remoteConfig.setDefaults(defaults)
        let setting = RemoteConfigSettings()
        setting.minimumFetchInterval = 0
        remoteConfig.configSettings = setting
        changueUI(value:true)
        
        remoteConfig.fetch(withExpirationDuration: 0) { state, error in
            if state == .success , error == nil {
                self.remoteConfig.activate { bool, error in
                    guard error == nil else {return}
                    let value = self.remoteConfig.configValue(forKey: "show_navigation_view").boolValue
                    DispatchQueue.main.sync {
                        self.changueUI(value:value)
                    }
                }
            }
            else {
                print(error!)
            }
        }
    }
    
    func changueUI(value:Bool){
        if (value){
            nvigationView.isHidden = false
        }
        else{
            nvigationView.isHidden = true
        }
    }
}

//MARK:- UITableViewDelegate,UITableviewDataSource

extension MainController: UITableViewDataSource,UITableViewDelegate{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel.data?.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainViewCellTableViewCell
        cell.name.text = viewModel.data?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        guard let url = viewModel.data?[indexPath.row].url else {return}
        guard let name = viewModel.data?[indexPath.row].name else {return}
        
        Analytics.logEvent("charchter_is_Selected", parameters: ["cahrchter_name": name])
    
        self.present(viewModel.setSelectedViewController(url: url,name:name ), animated: true)
    }
}
