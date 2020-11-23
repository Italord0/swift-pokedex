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
            Util.tintType(view: viewType2, pokemon: pokemon , type: 1)
        }else {
            viewType2.isHidden = true
        }
        
        lblType1.text = pokemon.types?[0].type?.name?.capitalizingFirstLetter()
        Util.tintType(view: viewType1, pokemon: pokemon, type: 0)
        
        cardView.isHidden = false
        
        
    }

}
