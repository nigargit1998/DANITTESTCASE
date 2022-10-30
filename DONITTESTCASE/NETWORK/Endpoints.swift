//
//  Endpoints.swift
//  DONITTESTCASE
//
//  Created by Nigar Mammadova on 29.10.22.
//

import Foundation
public protocol EndpointType {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
}

public enum Endpoints {
    case characters(page: Int)
    case characterCount
}

extension Endpoints: EndpointType {
    public var path: String {
        switch self {
        case .characters(let page):
            return "/character/?page=\(page)"
        case .characterCount:
            return "/character"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .characters, .characterCount:
            return .get
        }
    }
}
