//
//  Extension.swift
//  Pokemon
//
//  Created by norelhoda on 30.01.2022.
//

import Foundation

import UIKit

var imageCache = Cache<String, UIImage>()

    extension UIImageView {
        
        func load(urlString:String){
            guard let url = URL(string: urlString) else {return}
            if let image = imageCache.value(forKey: urlString ){
                self.image =  image
                return
            }
            DispatchQueue.global().async {
                [weak self] in
                if let data = try? Data(contentsOf: url){
                    if let image = UIImage(data:data){
                        DispatchQueue.main.async {
                            imageCache.insert(image, forKey: urlString )
                            self?.image = image
                        }
                    }
                }
            }
        }
    }

extension String {
    var tail: String { String(self[index(startIndex, offsetBy: 1)...]) }
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable",
                                 bundle: .main, value: self, comment: self)
    }
}

