//
//  QuestionTableViewCell.swift
//  Doutor
//
//  Created by Seong Eun Kim on 24/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}