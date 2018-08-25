//
//  QuestionCell.swift
//  Paciente
//
//  Created by Marcelo Martimiano Junior on 24/08/2018.
//  Copyright © 2018 Marcelo Martimiano Junior. All rights reserved.
//

import UIKit


class QuestionCell: UITableViewCell  {
    
    public private(set) var state: DftAwnser = .IDontKnow
   
    @IBOutlet weak var yesImage: UIImageView!
    @IBOutlet weak var dontKnowImage: UIImageView!
    @IBOutlet weak var noImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBAction func yesActon(_ sender: Any) {
        self.yesImage.image = UIImage(named: "optionSelected")
        self.noImage.image = UIImage(named: "optionNoSelected")
        self.dontKnowImage.image = UIImage(named: "optionNoSelected")
        
        self.state = .Yes
    }
    
    
    @IBAction func noAction(_ sender: Any) {
        self.noImage.image = UIImage(named: "optionSelected")
        self.yesImage.image = UIImage(named: "optionNoSelected")
        self.dontKnowImage.image = UIImage(named: "optionNoSelected")
        
        self.state = .No
    }
    
    
    @IBAction func dontKnowAction(_ sender: Any) {
        self.dontKnowImage.image = UIImage(named: "optionSelected")
        self.yesImage.image = UIImage(named: "optionNoSelected")
        self.noImage.image = UIImage(named: "optionNoSelected")
        
        self.state = .IDontKnow
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
        
    
}
