//
//  ProfileViewController.swift
//  Doutor
//
//  Created by Seong Eun Kim on 25/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit

class AppointmentInfoViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.setPatientLayout()


        // Do any additional setup after loading the view.
    }
    
    func setPatientLayout() {
        self.profileImage.circleImage(borderColor: UIColor(hexString: "#4E89AD").cgColor)
        
    }
}

extension AppointmentInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PositiveQuestionsCell", for: indexPath) as! PositiveQuestionsTableViewCell
        cell.questionLabel.text = "something"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! AppointmentInfoHeaderTableViewCell
        if section == 0 {
            headerCell.categoryLabel.text = "Respostas positivas"
        }
        return headerCell
    }
}
