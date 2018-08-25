//
//  MedicalCareVC.swift
//  Paciente
//
//  Created by Marcelo Martimiano Junior on 24/08/2018.
//  Copyright © 2018 Marcelo Martimiano Junior. All rights reserved.
//


import UIKit
class MedicalCareVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath)
                return cell
    }
    

}
