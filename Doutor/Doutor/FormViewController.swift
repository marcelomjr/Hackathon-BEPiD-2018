//
//  ViewController.swift
//  Saude
//
//  Created by Seong Eun Kim on 24/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var newQuestionTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    var questions: [String] = []
    var lastIndexPath: IndexPath?
    var numberOfSections = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.setTextViewLayout()
        self.setNavBarLayout()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    func setNavBarLayout() {
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "#4E89AD")
        navigationController?.navigationBar.topItem?.title = "Questionário"
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func setTextViewLayout() {
        self.newQuestionTextView.layer.borderColor = UIColor(hexString: "CCCCCC").cgColor
        self.newQuestionTextView.layer.borderWidth = 1
        self.newQuestionTextView.layer.cornerRadius = 15
    }
    
    // adds new question to the tableview
    @IBAction func okButtonPressed(_ sender: Any) {
        if self.newQuestionTextView.text != nil {
            self.questions.append(self.newQuestionTextView.text!)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            self.newQuestionTextView.text = ""
            self.newQuestionTextView.resignFirstResponder()
        }
    }
    
    @objc func keyboardWillShow(_ notification:NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            tableView.contentInset = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0)
        }
    }
    
    @objc func keyboardWillHide(_ notification:NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        }
    }
}

extension FormViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as! QuestionTableViewCell
        cell.questionLabel.text = self.questions[indexPath.row]
        
        return cell
    }
    
    
}

