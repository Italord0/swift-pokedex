//
//  PokemonTableViewCell.swift
//  pokedex
//
//  Created by Italo Melo on 22/08/20.
//  Copyright © 2020 Italo Melo. All rights reserved.
//

import UIKit
import SDWebImage

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var lblPokemonName: UILabel!
    
    @IBOutlet weak var ivPokemon: UIImageView!
    
    @IBOutlet weak var viewType1: UIView!
    
    @IBOutlet weak var viewType2: UIView!
    
    @IBOutlet weak var lblType1: UILabel!
    
    @IBOutlet weak var lblType2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.isHidden = true
        
    }
    
    func configure(with pokemon : Pokemon , idPokemon : Int){
        if(idPokemon == 1){
            print(Constants.ARTWORK_URL + String(idPokemon))
        }
        
        ivPokemon.sd_setImage(with: URL( string : Constants.ARTWORK_URL + String(idPokemon) + ".png"))
        
        self.lblPokemonName.text = pokemon.name?.capitalizingFirstLetter()
        
        if (pokemon.types!.count > 1) {
            lblType2.text = pokemon.types?[1].type?.name?.capitalizingFirstLetter()
            tintType(view: viewType2, pokemon: pokemon , type: 1)
        }else {
            viewType2.isHidden = true
        }
        
        lblType1.text = pokemon.types?[0].type?.name?.capitalizingFirstLetter()
        tintType(view: viewType1, pokemon: pokemon, type: 0)
        
        cardView.isHidden = false
        
        
    }
    
    func tintType (view : UIView , pokemon : Pokemon , type : Int){
        switch pokemon.types![type].type!.name! {
        case "normal":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_NORMAL)
        break
        case "fire":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_FIRE)
        break
        case "fighting":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_FIGHTING)
        break
        case "water" :
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_WATER)
        break
        case "flying" :
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_FLYING)
        break
        case "grass":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_GRASS)
        break
        case "poison":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_POISON)
        break
        case "eletric":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_ELETRIC)
        break
        case "ground":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_GROUND)
        break
        case "psychic":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_PSYCHIC)
        break
        case "rock":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_ROCK)
        break
        case "ice":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_ICE)
        break
        case "bug":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_BUG)
        break
        case "dragon":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_DRAGON)
        break
        case "ghost":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_GHOST)
        break
        case "dark":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_DARK)
        break
        case "steel":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_STEEL)
        break
        case "fairy":
            view.backgroundColor = UIColor(hexString: Constants.HEX_COLOR_FAIRY)
        break
        default:
            print()
        }
    }
    
}
