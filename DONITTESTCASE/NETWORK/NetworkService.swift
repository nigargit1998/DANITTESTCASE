//
//  NetworkService.swift
//  DONITTESTCASE
//
//  Created by Nigar Mammadova on 30.10.22.
//


import UIKit
import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    func fetchCharacters(page: Int, completed: @escaping (Swift.Result<Characters, Error>) -> Void) {
        Handler.shared.handle(endPoint: Endpoints.characters(page: page), completion: completed)
    }
    
    func fetchCharactersCount(completed: @escaping (Swift.Result<Characters, Error>) -> Void) {
        Handler.shared.handle(endPoint: Endpoints.characterCount, completion: completed)
    }
}
