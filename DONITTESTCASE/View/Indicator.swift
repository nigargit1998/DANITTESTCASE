//
//  Indicator.swift
//  DONITTESTCASE
//
//  Created by Mammadova Nigar Rauf on 01.11.22.
//

import UIKit
public class ActivityIndicatorView: UIActivityIndicatorView {
    
    public var shouldPauseUserInteractions: Bool = false

    public
    convenience
    init(
        indicatorColor: UIColor,
        shouldPauseUserInteractions: Bool = false
    ) {
        self.init()
        self.shouldPauseUserInteractions = shouldPauseUserInteractions
        color = indicatorColor
    }
}
