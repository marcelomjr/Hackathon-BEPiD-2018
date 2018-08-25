//
//  ProfileViewController.swift
//  Doutor
//
//  Created by Seong Eun Kim on 25/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit

protocol DoctorProfileDelegate: class {
    func presentNewQuestionaireAlert()
}

class DoctorProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var crmLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.setDoctorLayout()
        
        // change title
        navigationController?.navigationBar.topItem?.title = "Perfil"
    }
    
    // unwind to parent view controller
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }

    func setDoctorLayout() {
        
    }
}

extension DoctorProfileViewController: DoctorProfileDelegate {
    func presentNewQuestionaireAlert() {
        let alertMessage = UIAlertController(title: "Novo questionário", message: "Digite um nome para este questionário", preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "Continuar", style: .default, handler: { _ in
            self.accessQuestionaire(withName: alertMessage.textFields![0].text, isNew: true)
        }))
        alertMessage.addTextField(configurationHandler: nil)
        self.present(alertMessage, animated: true, completion: nil)
    }
    
    func accessQuestionaire(withName name: String?, isNew: Bool) {
        let questionaireController =
        self.performSegue(withIdentifier: "QuestionaireSegue", sender: nil)
    }
}

extension DoctorProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionaireCell", for: indexPath) as! QuestionaireCell
        cell.questionaireLabel.text = "something"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! QuestionaireInfoHeaderTableViewCell
        if section == 0 {
            headerCell.categoryLabel.text = "Questionários"
            headerCell.controllerDelegate = self
        }
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
