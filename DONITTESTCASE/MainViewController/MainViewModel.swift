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
    var refresh: Bool = false
    
    func getCharacters( page: Int, completion: @escaping (MainViewModelState) -> Void) {
        NetworkService.shared.fetchCharacters(page: page) { [weak self]
            result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.charactersState = self.refresh ? MainViewModelState.refresh(characters: response) : MainViewModelState.loaded(characters: response)
                completion(self.charactersState)
            case .failure(_):
                return
            }
        }
    }
    
    func getCharactersCount(completion: @escaping (Int) -> Void) {
        NetworkService.shared.fetchCharactersCount() { result in
            switch result {
            case .success(let response):
                completion(response.results.count)
            case .failure(_):
                return
            }
        }
    }
}
