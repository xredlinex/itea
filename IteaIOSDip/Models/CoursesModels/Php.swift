//
//  Php.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 12/2/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

func makePhpCourseFlow() -> CourseFlow {
 
    let fundomentals = Courses()
    fundomentals.courseName = "Основы Программирования"
    fundomentals.courseDescription = phpCoursesDescrioption()[0].courseDescriotion
    fundomentals.courseSkills = phpCoursesDescrioption()[0].courseSkills
    fundomentals.courseProgram = phpCoursesDescrioption()[0].courseProgram
    fundomentals.courseImage = "fundomentals"
    fundomentals.courseHeaderImage = "fundHeader"
      
    let phpBase = Courses()
    phpBase.courseName = "Базовый курс PHP"
    phpBase.courseDescription = phpCoursesDescrioption()[1].courseDescriotion
    phpBase.courseSkills = phpCoursesDescrioption()[1].courseSkills
    phpBase.courseProgram = phpCoursesDescrioption()[1].courseProgram
    phpBase.courseImage = "phpBase"
    phpBase.courseHeaderImage = "phpheader"
    
    let phpAdvanced = Courses()
    phpAdvanced.courseName = "Продвинутый курс PHP"
    phpAdvanced.courseDescription = phpCoursesDescrioption()[2].courseDescriotion
    phpAdvanced.courseSkills = phpCoursesDescrioption()[2].courseSkills
    phpAdvanced.courseProgram = phpCoursesDescrioption()[2].courseProgram
    phpAdvanced.courseImage = "phpAdvanced"
    phpAdvanced.courseHeaderImage = "phpheader"
        
    let php = CourseFlow()
    php.name = "PHP"
    php.courseType = "programming"
    php.courseTime = "night"
    php.coursesImage = "php-350"
    php.flowHeaderImage = "qa-350"
    php.typeDescription = phpTypeDescription().typeDescription
    php.typeLevelDescriptiom = phpTypeDescription().typeLevelDescription
    php.courses = [fundomentals, phpBase, phpAdvanced]
     return php
}
