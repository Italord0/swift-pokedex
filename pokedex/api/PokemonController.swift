//
//  PokemonController.swift
//  pokedex
//
//  Created by Italo Melo on 22/11/20.
//  Copyright © 2020 Italo Melo. All rights reserved.
//

import Foundation

import Alamofire

class PokemonController : NSObject {
    
    func list(callback: @escaping ( _ statusCode : Int, _ result : Result<PokemonRest, AFError>?) -> Void) -> Void {
    
        if Util.Connectivity.isConnectedToInternet() {

            let url : String = Constants.BASE_URL + "pokemon/?limit=1500"
    
            AF.request(url, method: .get).responseDecodable {
                (response : AFDataResponse<PokemonRest>) in
        
                let responseCode : Int = (response.response?.statusCode)!
                callback(responseCode, response.result)
        
            }
        }else{
            callback(999, nil)
        }
    }
    
    func detail(idPokemon : Int ,callback: @escaping ( _ statusCode : Int, _ result : Result<Pokemon, AFError>?) -> Void) -> Void {
    
        if Util.Connectivity.isConnectedToInternet() {

            let url : String = Constants.BASE_URL + "pokemon/" + String(idPokemon)
    
            AF.request(url, method: .get).responseDecodable {
                (response : AFDataResponse<Pokemon>) in
        
                let responseCode : Int = (response.response?.statusCode)!
                callback(responseCode, response.result)
        
            }
        }else{
            callback(999, nil)
        }
    }
    
}
