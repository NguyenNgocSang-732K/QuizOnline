//
//  ExamModel.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import Foundation
import UIKit



class ExamBase{
    var id:String? = ""
    var nameExam:String? = ""
    var questionExam:[ExamModel]?
    var time:String?
    
    init(id:String?, nameExam:String?, questionExam:[ExamModel]?, time:String?) {
        self.id = id
        self.nameExam = nameExam
        self.questionExam = questionExam
        self.time = time
    }
}


class ExamModel {
    var id:String? = ""
    var nameModelExam:String? = ""
    var question:String? = ""
    var imageExam:URL?
    var answer:[Answer] = []
    var answerUser:[String]? = []
    var answerExam:[String]? = []
    
    init(id:String?, nameModelExam:String?, question:String?, imageExam:URL?, answer:[Answer], answerUser:[String]?, answerExam:[String]? ) {
        self.id = id
        self.nameModelExam = nameModelExam
        self.question = question
        self.imageExam = imageExam
        self.answer = answer
        self.answerUser = answerUser
        self.answerExam = answerExam
    }
    
}


class Answer {
    var answer:String? = ""
    
    
    init(answer:String?) {
        self.answer = answer
    }
    
}
