//
//  CategoryItem.swift
//  DONITTESTCASE
//
//  Created by Nigar Mammadova on 29.10.22.
//

import Foundation
import UIKit

extension CategoryCell {
    public struct Item: Equatable{
        var name: String?
        var species: String?
        var status: String?
        var gender: String?
        
        public init(name: String?, species: String?, status: String?, gender: String?) {
            self.name = name
            self.species = species
            self.status = status
            self.gender = gender
        }
    }
}
