//
//  KitModelsDiscr.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/27/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

// MARK DESCRIPTION
func SomeTypeDescription() -> CoursesTypeDescription {
    let some = CoursesTypeDescription()
    some.typeDescription = """
    """
    some.typeLevelDescription = """
    """
    return some
}

func SomeCoursesDescrioption() -> [CourseDescription] {
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
