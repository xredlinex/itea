//
//  HumanResourses.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 12/2/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

// MARK DESCRIPTION
func humanDescription() -> CoursesTypeDescription {
    let human = CoursesTypeDescription()
    human.typeDescription = """
    """
    human.typeLevelDescription = """
    """
    return human
}

func humanCoursesDescrioption() -> [CourseDescription] {
    let SomeBase = CourseDescription()
    SomeBase.courseDescriotion = """
    """
    SomeBase.courseSkills = """
    """
    SomeBase.courseProgram = """
    """
    let someAdvanced = CourseDescription()
    someAdvanced.courseDescriotion = """
    """
    someAdvanced.courseSkills = """
    """
    someAdvanced.courseProgram = """
    """
    let someOther = CourseDescription()
       someOther.courseDescriotion = """
       """
       someOther.courseSkills = """
       """
       someOther.courseProgram = """
       """
    
    let moreCourse = CourseDescription()
       moreCourse.courseDescriotion = """
       """
       moreCourse.courseSkills = """
       """
       moreCourse.courseProgram = """
       """
    
    return [SomeBase, someAdvanced, someOther, moreCourse]
}
