//
//  AppointmentsViewController.swift
//  Paciente
//
//  Created by Seong Eun Kim on 25/08/18.
//  Copyright © 2018 Marcelo Martimiano Junior. All rights reserved.
//

import UIKit

class AppointmentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var selected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            selected = false
            tableView.reloadData()
        case 1:
            selected = true
            tableView.reloadData()
        default:
            break
        }
    }
    
}

extension AppointmentsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selected == false {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "AppointmentsCell", for: indexPath) as! AppointmentsTableViewCell
        return cell
    }
    
}
