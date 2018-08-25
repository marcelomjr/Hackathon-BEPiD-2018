//
//  AppointmentsTableViewCell.swift
//  Paciente
//
//  Created by Seong Eun Kim on 25/08/18.
//  Copyright © 2018 Marcelo Martimiano Junior. All rights reserved.
//

import UIKit

class AppointmentsTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
