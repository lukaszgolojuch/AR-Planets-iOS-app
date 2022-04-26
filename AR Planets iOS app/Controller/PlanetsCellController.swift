//
//  PlanetsCellController.swift
//  AR Planets iOS app
//
//  Created by Łukasz Gołojuch on 4/26/22.
//

import UIKit

class PlanetsCellController: UITableViewCell {

    @IBOutlet weak var planetCellView: UIView!
    @IBOutlet weak var planetIconImage: UIImageView!
    @IBOutlet weak var planetNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
