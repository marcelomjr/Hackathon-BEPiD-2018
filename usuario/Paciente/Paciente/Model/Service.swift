//
//  Service.swift
//  Paciente
//
//  Created by Marcelo Martimiano Junior on 25/08/2018.
//  Copyright © 2018 Marcelo Martimiano Junior. All rights reserved.
//

import Foundation
import Firebase

enum DftAwnser: Int {
    case IDontKnow = 0
    case No = -1
    case Yes = 1
}

struct DftQuestion {
    var question: String
    var awnser: DftAwnser
}


class Service {
    static var userID: String = "uid1010"
    
    static var ref: DatabaseReference!
    
    static func initFireBaseReference() {
        
        self.ref = Database.database().reference()
        
    }
    
    static func getUserForms() -> [DftQuestion]{
        var array = [DftQuestion]()
        array.append(DftQuestion(question: "Os pais já tiveram câncer?", awnser: .IDontKnow))
        array.append(DftQuestion(question: "Os pais têm problema cardíaco?", awnser: .No))
        array.append(DftQuestion(question: "Possui alergias?", awnser: .IDontKnow))
        array.append(DftQuestion(question: "Fuma?", awnser: .IDontKnow))
        array.append(DftQuestion(question: "Faz uso de medicamentos?", awnser: .IDontKnow))
        array.append(DftQuestion(question: "Possui alguma doença?", awnser: .IDontKnow))
        
        
        
        return array
    }
    
    static func sendUserForms(userQuestions: [DftQuestion]) {
        self.initFireBaseReference()
       
//        let questions = self.toNSDictionary(userQuestions: userQuestions)
        
         for question in userQuestions {
            
            self.ref.child("users/" + userID + "/questions").child(question.question).setValue("\(question.awnser.rawValue)")
        }
        
        
    }
//    static func toNSDictionary(userQuestions: [DftQuestion]) -> NSDictionary {
//
//        var counter: Int = 0
//
//        var dictionary = NSDictionary()
//
//        for question in userQuestions {
//            let d =
//            [
//                question.question: question.awnser.rawValue,
//            ]
//            dictionary = [counter: d]
//            counter += 1
//        }
////
//       return dictionary
//    }
}

