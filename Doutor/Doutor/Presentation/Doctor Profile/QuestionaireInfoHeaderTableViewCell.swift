//
//  AppointmentInfoHeaderTableViewCell.swift
//  Doutor
//
//  Created by Seong Eun Kim on 25/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit

class QuestionaireInfoHeaderTableViewCell: UITableViewCell {

    weak var controllerDelegate: DoctorProfileDelegate!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func newQuestionaire(_ sender: Any) {
        controllerDelegate.presentNewQuestionaireAlert()
    }
    
}
