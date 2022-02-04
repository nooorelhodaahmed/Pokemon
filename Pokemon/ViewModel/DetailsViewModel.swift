//
//  DetailsViewModel.swift
//  Pokemon
//
//  Created by norelhoda on 30.01.2022.
//

import Foundation
import UIKit

class DetailsViewModel {
    
    //MARK:- Proporties
    var imageArray :[String] = []
    var arrayOfState :[Stats] = []
    var stateName:[String] = []
    var stateValue:[Int] = []
    var reloadData :(()->())?
    
    //MARK:- fetch charchter Deatils data
    
    func fetchData(url:URL) {
       
            Services.shared.getCharachterDetails(parms: url) { [self] success in
                
                guard let data = success.sprites else {return}
                guard let states = success.stats else {return}
                self.setImageArray(data: data, states: states,completion: {
                    if self.imageArray.count != 0 {
                        self.reloadData!()
                    }
                })
            }
        }
    
    //MARK:- set charchter array of image and state data
    
    func setImageArray(data: Sprites,states:[Stats],completion:()->()){
        
        if let image = data.back_default {
            self.imageArray.append(image)
        }
        if let image = data.front_default{
            self.imageArray.append(image)
        }
        if let image = data.back_female {
            self.imageArray.append(image)
        }
        if let image = data.other?.home?.front_default {
            self.imageArray.append(image)
        }
        if let image = data.other?.home?.front_female {
            self.imageArray.append(image)
        }
        if let image = data.other?.dream_world?.front_default {
            self.imageArray.append(image)
        }
        if let image = data.other?.dream_world?.front_female {
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_i?.red_blue?.back_default {
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_i?.red_blue?.front_default{
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_ii?.crystal?.back_default{
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_ii?.crystal?.front_default {
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_ii?.gold?.back_default{
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_ii?.gold?.front_default {
            self.imageArray.append(image)
        }
        if let image19 = data.versions?.generation_ii?.silver?.back_default{
            self.imageArray.append(image19)
        }
        if let image20 = data.versions?.generation_ii?.silver?.front_default {
            self.imageArray.append(image20)
        }
        if let image21 = data.versions?.generation_iii?.emerald?.front_default{
            self.imageArray.append(image21)
        }
        if let image22 = data.versions?.generation_iii?.firered_leafgreen?.front_default {
            self.imageArray.append(image22)
        }
        if let image23 = data.versions?.generation_iii?.firered_leafgreen?.back_default{
            self.imageArray.append(image23)
        }
        if let image24 = data.versions?.generation_iii?.ruby_sapphire?.front_default {
            self.imageArray.append(image24)
        }
        if let image25 = data.versions?.generation_iii?.ruby_sapphire?.back_default{
            self.imageArray.append(image25)
        }
        if let image26 = data.versions?.generation_iv?.diamond_pearl?.front_default{
            self.imageArray.append(image26)
        }
        if let image27 = data.versions?.generation_iv?.diamond_pearl?.back_default {
            self.imageArray.append(image27)
        }
        if let image = data.versions?.generation_iv?.heartgold_soulsilver?.front_default{
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_iv?.heartgold_soulsilver?.back_default {
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_iv?.platinum?.front_default{
            self.imageArray.append(image)
        }
        
        if let image = data.versions?.generation_iv?.platinum?.back_default{
            self.imageArray.append(image)
        }
        
        if let image = data.versions?.generation_iv?.diamond_pearl?.front_default{
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_iv?.diamond_pearl?.back_default {
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_iv?.heartgold_soulsilver?.front_default{
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_iv?.heartgold_soulsilver?.back_default {
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_iv?.platinum?.front_default{
            self.imageArray.append(image)
        }
        
       if let image = data.versions?.generation_iv?.platinum?.back_default{
            self.imageArray.append(image)
        
        if let image = data.versions?.generation_v?.black_white?.front_default {
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_v?.black_white?.back_default{
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_vi?.omegaruby_alphasapphire?.front_default {
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_vi?.x_y?.front_default{
            self.imageArray.append(image)
        }
        
        if let image = data.versions?.generation_vii?.icons?.front_default{
            self.imageArray.append(image)
        }
        if let image = data.versions?.generation_vii?.ultra_sun_ultra_moon?.front_default{
            self.imageArray.append(image)
        }
        
        if let image = data.versions?.generation_viii?.icons?.front_default{
            self.imageArray.append(image)
        }
        
        for state in states {
            stateName.append((state.stat?.name)!)
            stateValue.append(state.base_stat!)
        }
        completion()
    }
  }
}
