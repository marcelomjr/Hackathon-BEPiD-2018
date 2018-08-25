//
//  Service.swift
//  Paciente
//
//  Created by Marcelo Martimiano Junior on 25/08/2018.
//  Copyright © 2018 Marcelo Martimiano Junior. All rights reserved.
//

import Foundation

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
    static func getUserForms() -> [DftQuestion]{
        var array = [DftQuestion]()
        array.append(DftQuestion(question: "dor de cabeça", awnser: .IDontKnow))
        array.append(DftQuestion(question: "cancer", awnser: .No))
        array.append(DftQuestion(question: "alergia", awnser: .IDontKnow))
        array.append(DftQuestion(question: "coceira", awnser: .IDontKnow))
        array.append(DftQuestion(question: "cócega", awnser: .IDontKnow))
        array.append(DftQuestion(question: "sede", awnser: .IDontKnow))
        

        
        return array
    }
    
    static func sendUserForms(userQuestions: [DftQuestion]) {
        print(userQuestions)
    }
}
