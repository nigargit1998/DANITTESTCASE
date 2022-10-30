//
//  UiImage+estension.swift
//  DONITTESTCASE
//
//  Created by Nigar Mammadova on 30.10.22.
//

import UIKit
import Foundation

public extension UIImageView {
    func downloadImage(url: String) {

        guard let urlAdress = URL(string: url) else { return }
        let dataTask = URLSession.shared.dataTask(with: urlAdress, completionHandler: { [weak self] (data, _, _) in
            if let data = data {
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            }
        })
        
        dataTask.resume()
    }
}
