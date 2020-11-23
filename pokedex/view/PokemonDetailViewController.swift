//
//  PokemonDetailViewController.swift
//  pokedex
//
//  Created by Italo Melo on 23/11/20.
//  Copyright © 2020 Italo Melo. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    var pokemon : Pokemon!

    @IBOutlet weak var lblPokemonName: UILabel!
    
    
    @IBOutlet weak var lblPokemonNumber: UILabel!
    
    @IBOutlet weak var ivPokemon: UIImageView!
    
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ivPokemon.sd_setImage(with: URL( string : Constants.ARTWORK_URL + String(pokemon.id!) + ".png"))

        
        Util.tintType(view: contentView, pokemon: pokemon, type: 0)
        
        Util.tintType(view: view, pokemon: pokemon, type: 0)
        
        lblPokemonName.text = pokemon.name?.capitalizingFirstLetter()
        lblPokemonNumber.text = "#" + String(pokemon.id!)
        
        
    }

}
