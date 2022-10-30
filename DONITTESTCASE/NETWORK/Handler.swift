//
//  Handler.swift
//  DONITTESTCASE
//
//  Created by Nigar Mammadova on 30.10.22.
//

import Foundation

public struct Handler {

    private init() {}

    static let shared = Handler()
    private let baseURL = "https://rickandmortyapi.com/api"

    func handle<T:Decodable> ( endPoint: EndpointType, completion: @escaping (Swift.Result<T, Error>) -> Void) {

        if let url = URL(string: baseURL + endPoint.path) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let json = try decoder.decode(T.self, from: data)
                completion(.success(json))

            } catch {
                completion(.failure(error))
            }

        } else {
            completion(.failure(Error.self as! Error))

        }

    }

}
