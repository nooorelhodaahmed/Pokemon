//
//  DetailsController.swift
//  Pokemon
//
//  Created by norelhoda on 30.01.2022.
//

import UIKit

class DetailsController: UIViewController {

    //MARK:- Proporties
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var charchterName: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var stateLabel: UILabel!
   
    var url : String?
    var name : String?
    lazy var viewModel : DetailsViewModel = {
        return DetailsViewModel()
    }()
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
      initView()
      initVm()
    }

    //MARK:- intiateView
    
    func initView(){
        
        charchterName.text = self.name
        backButton.titleLabel?.text = NSLocalizedString("Back", value: "Back", comment: "")
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(UINib(nibName: "DetailColectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        customCollectionViewCell()
        tableView.dataSource  = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
    }
    //MARK:- viewModel Binding
    
    func initVm(){
        guard let url = self.url else {return}
        viewModel.fetchData(url: URL(string: url)!)
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
            self?.tableView.reloadData()
        }
    }

    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK:- UICollectionViewDelegate,UICollectionViewDataSource

extension DetailsController:UICollectionViewDelegate,UICollectionViewDataSource,
                            UICollectionViewDelegateFlowLayout {

    func customCollectionViewCell() {
       let flowLayout = UICollectionViewFlowLayout()
       flowLayout.itemSize = CGSize(width: (collectionView.bounds.width / 15) - 40, height: collectionView.bounds.height / 2 - 40)
        flowLayout.scrollDirection = .vertical
       flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
       flowLayout.minimumLineSpacing = 10
       flowLayout.minimumInteritemSpacing = 10
       collectionView.setCollectionViewLayout(flowLayout, animated: false)
   }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/6, height: collectionView.frame.height/6)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.imageArray.count
    }
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailColectionViewCell

        cell.image.load(urlString: viewModel.imageArray[indexPath.row])
        return cell
    }
    
}

//MARK:- UITableViewDelegate,UITableViewDataSource

extension DetailsController:UITableViewDelegate,UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.stateName.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailTableViewCell
        cell.name.text = self.viewModel.stateName[indexPath.row].trimmingCharacters(in: .whitespaces)
        cell.value.text =  String(self.viewModel.stateValue[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
 
