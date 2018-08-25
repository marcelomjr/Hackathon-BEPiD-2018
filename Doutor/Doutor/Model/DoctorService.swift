//
//  DoctorService.swift
//  Doutor
//
//  Created by Marcelo Martimiano Junior on 25/08/2018.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import Foundation
import FirebaseDatabase

public struct Treatment {
    var time: String
    var treatmentID: String
    var userID: String
}

public struct Doctor {
    var crm: String
    var name: String
    var area: String
    var forms: [String]
    var imageURL: String
}

class DoctorService {
    static var ref: DatabaseReference!
    
    static func initFirebaseRef() {
        self.ref = Database.database().reference()
    }
  
    static func getDoctor(doctorCRM:String, completion: @escaping (Doctor) -> Void) {
        self.initFirebaseRef()
        
        self.ref.child("doctors/\(doctorCRM)").observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as! NSDictionary
            
                var formNames = [String]()
                let formDictionary = value.value(forKeyPath: "forms") as! NSArray
            
                for entry in formDictionary {
                    let entry = entry as! NSDictionary
                    for (key,_) in entry {
                        formNames.append(key as! String)
                    }
                }
            
                let doctor = Doctor(crm: doctorCRM,
                                    name: value.value(forKey: "nome") as! String,
                                    area: value.value(forKey: "area") as! String,
                                    forms: formNames,
                                    imageURL: value.value(forKey: "imageURL") as! String)
                completion(doctor)
            })
    }
    
    static func getDaySchedule(doctorCRM: String, day: String, completion: @escaping ([Treatment]) -> Void) {
        self.initFirebaseRef()
        
        self.ref.child("doctors/\(doctorCRM)/schedule/\(day)").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            if let keys = value?.allKeys,
                let values = value?.allValues {
                
                let treatmentsNumber = keys.count
                var schedule =  [Treatment]()
                
                for index in 0 ..< treatmentsNumber {
                    
                    if let treatmentDictionary = values[index] as? NSDictionary {
                   
                        let treatment = Treatment(time: keys[index] as! String,
                                                  treatmentID:  treatmentDictionary.value(forKey: "userID") as! String,
                                                  userID: treatmentDictionary.value(forKey: "treatment") as! String)
                        schedule.append(treatment)
                    }
                }
                completion(schedule)
            }
        })
    }
    
    static func createTreatment(userID: String, treatmentID: String) {
        
        self.ref.child("users/\(userID)/Treatments").child(treatmentID).child("CRM").setValue("007")
        self.ref.child("users/\(userID)/Treatments").child(treatmentID).child("FormsState").setValue("Not")
        self.ref.child("users/\(userID)/Treatments").child(treatmentID).child("Measurements").setValue("")
        self.ref.child("users/\(userID)/Treatments").child(treatmentID).child("Recommendations").setValue("")
//        self.ref.child("users/\(userID)/Treatments").child(treatmentID).child("Forms").child
    }
    
//    static func createDaySchedule(doctorCRM: String, day: String) {
//
//        let cons1 = DoctorTreatment(doctorCRM: "007", userID: "juliane", forms: nil, measurement: nil, recomendations: "")
//        let cons2 = DoctorTreatment(doctorCRM: "007", userID: "marcelo", forms: nil, measurement: nil, recomendations: "")
//        let cons3 = DoctorTreatment(doctorCRM: "007", userID: "seong", forms: nil, measurement: nil, recomendations: "")
//        let cons4 = DoctorTreatment(doctorCRM: "007", userID: "gustavo", forms: nil, measurement: nil, recomendations: "")
//        for dic in cons1.toNSDictionary() {
//            self.ref.child("\(doctorCRM)/schedule/\(day)").child(dic.)
//        }
 
 
    
        
    
        
}
