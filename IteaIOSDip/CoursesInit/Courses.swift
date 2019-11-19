//
//  Courses.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/18/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

func makeQaCourses() -> [Courses] {
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
     
    return [qaBase, qaAdvanced, qaAutomation]
}





