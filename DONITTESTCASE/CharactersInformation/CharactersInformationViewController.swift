//
//  CharactersInformationViewController.swift
//  DONITTESTCASE
//
//  Created by Nigar Mammadova on 30.10.22.
//

import UIKit

class CharactersInformationViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var GenderLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    
    var result: ResultsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = result?.name
        GenderLabel.text = result?.gender
        statusLabel.text = result?.status
        typeLabel.text = result?.type
        originLabel.text = result?.origin?.name
        imageView.downloadImage(url: (result?.image!)!)
        
    }
    

}
