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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func indexChanged(_ sender: Any) {
//        switch segmentedControl.selectedSegmentIndex {
//        case 0:
//
//        }
    }
    
}

extension AppointmentsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "AppointmentsCell", for: indexPath) as! AppointmentsTableViewCell
        return cell
    }
    
}
