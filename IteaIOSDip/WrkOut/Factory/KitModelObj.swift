//
//  KitModelObj.swift
//  fla-ios
//
//  Created by alexey sorochan on 11/27/19.
//  Copyright © 2019 Nordstrom. All rights reserved.
//

import UIKit

func makeSomeOtherObj() -> CourseFlow {
 
      let qaBase = Courses()
       qaBase.courseName = "Базовый курс QA"
       qaBase.courseDescription = qaCoursesDescrioption()[0].courseDescriotion
       qaBase.courseSkills = qaCoursesDescrioption()[0].courseSkills
       qaBase.courseProgram = qaCoursesDescrioption()[0].courseProgram
       qaBase.courseImage = "qaBase"
       qaBase.courseHeaderImage = "qaHeader"
      
       let qaAdvanced = Courses()
       qaAdvanced.courseName = "Продвинутый курс QA"
       qaAdvanced.courseDescription = qaCoursesDescrioption()[1].courseDescriotion
       qaAdvanced.courseSkills = qaCoursesDescrioption()[1].courseSkills
       qaAdvanced.courseProgram = qaCoursesDescrioption()[1].courseProgram
       qaAdvanced.courseImage = "qaAdvanced"
       qaAdvanced.courseHeaderImage = "qaHeader"
        
       let qaAutomation = Courses()
       qaAutomation.courseName = "QA Automation"
       qaAutomation.courseDescription = qaCoursesDescrioption()[2].courseDescriotion
       qaAutomation.courseSkills = qaCoursesDescrioption()[2].courseSkills
       qaAutomation.courseProgram = qaCoursesDescrioption()[2].courseProgram
       qaAutomation.courseImage = "qaAutomation"
       qaAutomation.courseHeaderImage = "qaHeader"
       
       let qa = CourseFlow()
       qa.name = "QA Testing"
       qa.courseType = "qa"
       qa.courseTime = "day"
       qa.coursesImage = "qa-350"
       qa.flowHeaderImage = "qa-350"
       qa.typeDescription = qaTypeDescription().typeDescription
       qa.typeLevelDescriptiom = qaTypeDescription().typeLevelDescription
       qa.courses = [qaBase, qaAdvanced, qaAutomation]
     return qa
}
