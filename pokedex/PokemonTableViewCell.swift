//
//  PokemonTableViewCell.swift
//  pokedex
//
//  Created by Italo Melo on 22/08/20.
//  Copyright © 2020 Italo Melo. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblPokemonName: UILabel!
    
    @IBOutlet weak var ivPokemon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
