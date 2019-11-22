//
//  FlowCourses.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/18/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

class IteaCourse {
    
    func makeCoursesFlow() -> [CourseFlow] {
       let qa = makeQaCourses()

        return [qa]
    }
    
    
    func makeQaCourses() -> CourseFlow {
     
     let qaBase = Courses()
     qaBase.courseName = "Базовый курс QA"
     qaBase.courseDescription = qaCoursesDescrioption()[0].courseDescriotion
     qaBase.courseSkills = qaCoursesDescrioption()[0].courseSkills
     qaBase.courseProgram = qaCoursesDescrioption()[0].courseProgram
     qaBase.courseImage = "qaBase"
    
     let qaAdvanced = Courses()
     qaAdvanced.courseName = "Продвинутый курс QA"
     qaAdvanced.courseDescription = qaCoursesDescrioption()[0].courseDescriotion
     qaAdvanced.courseSkills = qaCoursesDescrioption()[0].courseSkills
     qaAdvanced.courseProgram = qaCoursesDescrioption()[0].courseProgram
     qaAdvanced.courseImage = "qaAdvanced"
     
     let qaAutomation = Courses()
     qaAutomation.courseName = "QA Automation"
     qaAutomation.courseDescription = qaCoursesDescrioption()[0].courseDescriotion
     qaAutomation.courseSkills = qaCoursesDescrioption()[0].courseSkills
     qaAutomation.courseProgram = qaCoursesDescrioption()[0].courseProgram
     qaAutomation.courseImage = "qaAutomation"
        
    
    let qa = CourseFlow()
    qa.name = "ТЕСТИРОВАНИЕ"
    qa.courseType = "QA"
    qa.courseTime = "Вечерние"
    qa.coursesImage = "noCourseImage"
    qa.typeDescription = qaTypeDescription().typeDescription
    qa.typeLevelDescriptiom = qaTypeDescription().typeLevelDescription
    qa.courses = [qaBase, qaAdvanced, qaAutomation]
        
     return qa
    
    
    
    
    
}




}






