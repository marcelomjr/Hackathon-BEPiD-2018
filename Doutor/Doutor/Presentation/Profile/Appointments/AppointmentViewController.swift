//
//  AppointmentViewController.swift
//  Doutor
//
//  Created by Seong Eun Kim on 25/08/18.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit

class AppointmentViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var treataments = [Treatment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DoctorService.getDaySchedule(doctorCRM: "007", day: "2018 08 25", completion: { respTreataments in
            self.treataments = respTreataments
            self.collectionView.reloadData()
        })
        
        
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setNavBarLayout()
        DoctorService.createTreatment(userID: "uid1010", treatmentID: "2016")
    }
    
    func setNavBarLayout() {
        // change nav bar title
        navigationController?.navigationBar.topItem?.title = "Consultas"
    }

}

extension AppointmentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.treataments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "appointmentsCell", for: indexPath) as! AppointmentCollectionViewCell
        
        cell.timeLabel.text = self.treataments[indexPath.row].time
        return cell
    }
    
}
