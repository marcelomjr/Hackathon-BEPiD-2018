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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setNavBarLayout()
    }
    
    func setNavBarLayout() {
        // change nav bar title
        navigationController?.navigationBar.topItem?.title = "Consultas"
    }

}

extension AppointmentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "appointmentsCell", for: indexPath) as! AppointmentCollectionViewCell
        cell.timeLabel.text = "9:00"
        return cell
    }
    
}
