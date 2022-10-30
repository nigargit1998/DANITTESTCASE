//
//  MainViewModel.swift
//  DONITTESTCASE
//
//  Created by Nigar Mammadova on 30.10.22.
//


import Foundation
import Combine


class MainViewModel : ObservableObject {
    
    var charactersState: MainViewModelState = MainViewModelState.idle
    
    func getCharacters( page: Int, completion: @escaping (MainViewModelState) -> Void) {
        NetworkService.shared.fetchCharacters(page: page) { [weak self]
            result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.charactersState = MainViewModelState.loaded(characters: response)
                completion(self.charactersState)
            case .failure(_):
                return
            }
        }
    }
}
