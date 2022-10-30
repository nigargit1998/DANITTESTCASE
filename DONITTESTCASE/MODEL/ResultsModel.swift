//
//  ResultsModel.swift
//  DONITTESTCASE
//
//  Created by Nigar Mammadova on 29.10.22.
//

import Foundation

public struct ResultsModel: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String?]
    let url: String?
    let created: String?
}

public struct Location: Codable {
    var name: String?
    var url: String?
}
