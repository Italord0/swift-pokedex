//
//  ViewController.swift
//  pokedex
//
//  Created by Italo Melo on 21/08/20.
//  Copyright © 2020 Italo Melo. All rights reserved.
//

import UIKit

struct Pokemon {
    let id: Int;
    let name: String;
}

class ViewController: UIViewController {

    @IBOutlet weak var tblPokemon: UITableView!
    
    var dataPokedex : [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblPokemon.dataSource = self;
        tblPokemon.delegate = self;
        loadData();
        
    }

    func loadData(){
        dataPokedex.append(Pokemon(id: 1, name: "Bulbassaur"))
        dataPokedex.append(Pokemon(id: 2, name: "Ivysaur"))
    }
}

extension ViewController: UITableViewDataSource ,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 83;
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataPokedex.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         guard let pokemonCell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as? PokemonTableViewCell else {
            return UITableViewCell()
        }
        
        let pokemon = dataPokedex[indexPath.row]
        
        pokemonCell.lblPokemonName.text = "\(pokemon.id) - \(pokemon.name)"
        
        return pokemonCell
    }
}
