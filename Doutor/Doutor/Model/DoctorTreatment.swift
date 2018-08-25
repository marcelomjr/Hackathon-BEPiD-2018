//
//  DoctorTreatment.swift
//  Doutor
//
//  Created by Marcelo Martimiano Junior on 25/08/2018.
//  Copyright © 2018 Seong Eun Kim. All rights reserved.
//

import UIKit
struct DoctorTreatment {
    var doctorCRM: String
    var userID: String
    var forms: [[String: String]]?
    var formsState: String
    var measurement: [String: [Int: Int]]?
    var recomendations: String?
    var treatmentID: String!
    var treatmentFinished: Bool!
    
    func toNSDictionary() -> [NSDictionary] {
        let array = [
            NSDictionary(dictionary: ["treatmentID":  self.treatmentID]),
            NSDictionary(dictionary: ["CRM":  self.doctorCRM]),
            NSDictionary(dictionary: ["userID":  self.userID]),
            NSDictionary(dictionary: ["forms":  forms]),
            NSDictionary(dictionary: ["measurement":  measurement]),
            NSDictionary(dictionary: ["recomendations":  recomendations]),
            NSDictionary(dictionary: ["formsState":  formsState]),
            NSDictionary(dictionary: ["treatmentFinished":  treatmentFinished])
        ]
        return array
    }
    
    
}
