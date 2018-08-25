//
//  MedicalCareVC.swift
//  Paciente
//
//  Created by Marcelo Martimiano Junior on 24/08/2018.
//  Copyright © 2018 Marcelo Martimiano Junior. All rights reserved.
//


import UIKit
import Firebase

class MedicalCareVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    


    var userQuestions = [DftQuestion]()
    
    override func viewDidLoad() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.userQuestions = Service.getUserForms()
        
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! QuestionCell
        self.setdeaultAnser(cell: cell, question: userQuestions[indexPath.row])
        return cell
    }

    @IBAction func doneButton(_ sender: Any) {
        
        Service.sendUserForms(userQuestions: self.userQuestions)
    }
    
    func setdeaultAnser(cell: QuestionCell, question: DftQuestion) {
        if question.awnser == .IDontKnow {
            cell.dontKnowAction(0)
        } else if question.awnser == .No {
            cell.noAction(0)
        } else {
            cell.yesActon(0)
        }
        
        cell.questionLabel.text = question.question
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let questionCell = cell as? QuestionCell {
            self.userQuestions[indexPath.row].awnser = questionCell.state
        }
    }
}
