//
//  PokemonListViewController.swift
//  pokedex
//
//  Created by Italo Melo on 22/11/20.
//  Copyright © 2020 Italo Melo. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var pokemonTableView: UITableView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let list : NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listAllPokemons()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemonCell = UITableViewCell()
                if let pokemonCell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as? PokemonTableViewCell{
                    
                    let controller : PokemonController = PokemonController()
                    controller.detail(idPokemon: indexPath.row + 1){ (statusCode, result) in
                        switch statusCode {
                        case 200:
                            do {
                                let pokemon = try result!.get() as Pokemon
                                    pokemonCell.configure(with: pokemon, idPokemon : indexPath.row + 1)
                                    pokemonCell.tag = indexPath.row
                            }catch{
                            
                            }
                            break
                            default:
                            print(statusCode)
                            break
                                         
                        }
                    
                }
                    
                }
                
        pokemonCell.selectionStyle = .none
                return pokemonCell
    }
    
    func listAllPokemons(){
            self.indicator?.isHidden = false
                    let controller : PokemonController = PokemonController()
                controller.list { (statusCode, result) in
                        self.indicator?.isHidden = true
                        switch statusCode {
                        case 200:
                            print(statusCode)
                                do{
                                    print(try result!.get().results.count)
                                    self.list.removeAllObjects()
                                    self.list.addObjects(from: try result!.get().results)
                                    self.pokemonTableView.reloadData()
                                }catch{
                                    print(error)
                                }
                            
                            break
                            default:
                            Util.alert(view: self, title: "ERRO".localized(), message: "ERRO_CONEXAO_SERVIDOR".localized())
                            break
                                         
                        }
                    }
        }

}
