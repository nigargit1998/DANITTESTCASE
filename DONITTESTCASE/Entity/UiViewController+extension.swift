//
//  UiViewController+extension.swift
//  DONITTESTCASE
//
//  Created by Mammadova Nigar Rauf on 01.11.22.
//
import UIKit

extension ViewLoad where Self: UIViewController {
    func showIndicator() {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = !self.indicator.shouldPauseUserInteractions
            self.indicator.center = self.navigationController?.view.center ?? self.view.center
            self.indicator.startAnimating()
            self.indicator.superview?.bringSubviewToFront(self.indicator)
        }
    }
    
    func hideIndicator() {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = true
            self.indicator.stopAnimating()
        }
    }
}
