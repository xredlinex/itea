//
//  Cplus.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/29/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

func makeCPlusProgrammingCourses() -> CourseFlow {
 
     let cplusBase = Courses()
     cplusBase.courseName = "Базовый курс C++"
     cplusBase.courseDescription = cplusDescrioption()[0].courseDescriotion
     cplusBase.courseSkills = cplusDescrioption()[0].courseSkills
     cplusBase.courseProgram = cplusDescrioption()[0].courseProgram
     cplusBase.courseImage = "cplusBase"
     cplusBase.courseHeaderImage = "cplusHeader"

     let cplusdvanced = Courses()
     cplusdvanced.courseName = "Продвинутый курс C++"
     cplusdvanced.courseDescription = cplusDescrioption()[1].courseDescriotion
     cplusdvanced.courseSkills = cplusDescrioption()[1].courseSkills
     cplusdvanced.courseProgram = cplusDescrioption()[1].courseProgram
     cplusdvanced.courseImage = "cplusAdvanced"
     cplusdvanced.courseHeaderImage = "cplusHeader"
     
     let cplus = CourseFlow()
     cplus.name = "C++"
     cplus.courseType = "programming"
     cplus.courseTime = "night"
     cplus.coursesImage = "roadmap_cplus"
     cplus.flowHeaderImage = "cplusHeader"
     cplus.typeDescription = cplusTypeDescription().typeDescription
     cplus.typeLevelDescriptiom = cplusTypeDescription().typeLevelDescription
     cplus.courses = [cplusBase, cplusdvanced]
        
     return cplus
}
