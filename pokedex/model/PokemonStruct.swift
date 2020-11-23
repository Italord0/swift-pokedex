//
//  PokemonStruct.swift
//  pokedex
//
//  Created by Italo Melo on 22/11/20.
//  Copyright © 2020 Italo Melo. All rights reserved.
//

import Foundation

struct Pokemon : Codable {
    
    var id: Int?
    var name : String?
    var url : String?
    var types : [TypeRest]?
    
}

struct PokemonRest : Codable {
    var results : [Pokemon]
}

struct Type : Codable {
    var name : String?
    var url : String?
}

struct TypeRest : Codable {
    var slot : Int?
    var type : Type?
}
