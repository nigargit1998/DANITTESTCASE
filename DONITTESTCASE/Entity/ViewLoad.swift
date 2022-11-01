//
//  ViewLoad.swift
//  DONITTESTCASE
//
//  Created by Mammadova Nigar Rauf on 01.11.22.
//

import Foundation

protocol ViewLoad: AnyObject {
    var indicator: ActivityIndicatorView { get }
    func showIndicator()
    func hideIndicator()
}
