//
//  Java.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/23/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit


func makeJsProgrammingCourses() -> CourseFlow {
 
     let javaBase = Courses()
     javaBase.courseName = "Базовый курс Java"
     javaBase.courseDescription = javaProgrammingCoursesDescrioption()[0].courseDescriotion
     javaBase.courseSkills = javaProgrammingCoursesDescrioption()[0].courseSkills
     javaBase.courseProgram = javaProgrammingCoursesDescrioption()[0].courseProgram
     javaBase.courseImage = "javaBase"
    
    
    let javaAdvanced = Courses()
    javaAdvanced.courseName = "Продвинутый курс Java"
    javaAdvanced.courseDescription = javaProgrammingCoursesDescrioption()[1].courseDescriotion
    javaAdvanced.courseSkills = javaProgrammingCoursesDescrioption()[1].courseSkills
    javaAdvanced.courseProgram = javaProgrammingCoursesDescrioption()[1].courseProgram
    javaAdvanced.courseImage = "javaAdvanced"
    
    let javaWebApps = Courses()
    javaWebApps.courseName = "Разработка Java веб-приложений"
    javaWebApps.courseDescription = javaProgrammingCoursesDescrioption()[2].courseDescriotion
    javaWebApps.courseSkills = javaProgrammingCoursesDescrioption()[2].courseSkills
    javaWebApps.courseProgram = javaProgrammingCoursesDescrioption()[2].courseProgram
    javaWebApps.courseImage = "javaWebApps"
    
    let scalaProgramming = Courses()
    scalaProgramming.courseName = "Scala programming"
    scalaProgramming.courseDescription = javaProgrammingCoursesDescrioption()[3].courseDescriotion
    scalaProgramming.courseSkills = javaProgrammingCoursesDescrioption()[3].courseSkills
    scalaProgramming.courseProgram = javaProgrammingCoursesDescrioption()[3].courseProgram
    scalaProgramming.courseImage = "scalaProgramming"
    
    let javaProgramming = CourseFlow()
    javaProgramming.name = "JAVA PROGRAMMING"
    javaProgramming.courseType = "programming"
    javaProgramming.courseTime = "night"
    javaProgramming.coursesImage = "java-350"
    javaProgramming.typeDescription = javaProgrammingTypeDescription().typeDescription
    javaProgramming.typeLevelDescriptiom = javaProgrammingTypeDescription().typeLevelDescription
    javaProgramming.courses = [javaBase, javaAdvanced, javaWebApps, scalaProgramming]
        
     return javaProgramming
}

