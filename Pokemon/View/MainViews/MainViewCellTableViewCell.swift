//
//  MainViewCellTableViewCell.swift
//  Pokemon
//
//  Created by norelhoda on 30.01.2022.
//

import UIKit

class MainViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
