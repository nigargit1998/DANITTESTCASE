//
//  CategoryCell.swift
//  DONITTESTCASE
//
//  Created by Nigar Mammadova on 29.10.22.
//

import UIKit

class CategoryCell: UITableViewCell {

    public static var height: CGFloat { 90.0 }
    @IBOutlet weak var imagePerson: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func config(item: Item){
        genderLabel.text = item.gender
        nameLabel.text = item.name
        speciesLabel.text = item.species
        statusLabel.text = item.status
    }
    
}
