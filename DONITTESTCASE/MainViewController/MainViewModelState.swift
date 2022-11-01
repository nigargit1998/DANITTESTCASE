//
//  MainViewModelState.swift
//  DONITTESTCASE
//
//  Created by Nigar Mammadova on 30.10.22.
//

import Foundation

enum MainViewModelState {
    case idle
    case loading
    case loaded(characters: Characters)
    case refresh(characters: Characters)
    case error(errorMessage: String)
}
