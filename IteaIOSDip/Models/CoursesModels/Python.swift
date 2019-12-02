//
//  Python.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 12/2/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

func makePython() -> CourseFlow {
 
    let pythonBase = Courses()
    pythonBase.courseName = "Базовый курс Python"
    pythonBase.courseDescription = pythonCoursesDescrioption()[0].courseDescriotion
    pythonBase.courseSkills = pythonCoursesDescrioption()[0].courseSkills
    pythonBase.courseProgram = pythonCoursesDescrioption()[0].courseProgram
    pythonBase.courseImage = "pythonBase"
    pythonBase.courseHeaderImage = "python"
      
    let pythonAdvanced = Courses()
    pythonAdvanced.courseName = "Продвинутый курс Python"
    pythonAdvanced.courseDescription = pythonCoursesDescrioption()[1].courseDescriotion
    pythonAdvanced.courseSkills = pythonCoursesDescrioption()[1].courseSkills
    pythonAdvanced.courseProgram = pythonCoursesDescrioption()[1].courseProgram
    pythonAdvanced.courseImage = "pythonAdvanced"
    pythonAdvanced.courseHeaderImage = "python"
        
    let django = Courses()
    django.courseName = "Веб-разработка на Python/Django"
    django.courseDescription = pythonCoursesDescrioption()[2].courseDescriotion
    django.courseSkills = pythonCoursesDescrioption()[2].courseSkills
    django.courseProgram = pythonCoursesDescrioption()[2].courseProgram
    django.courseImage = "django"
    django.courseHeaderImage = "pythondjango"
       
    let dataScience = Courses()
    dataScience.courseName = "Python/R for Data science"
    dataScience.courseDescription = pythonCoursesDescrioption()[3].courseDescriotion
    dataScience.courseSkills = pythonCoursesDescrioption()[3].courseSkills
    dataScience.courseProgram = pythonCoursesDescrioption()[3].courseProgram
    dataScience.courseImage = "dataScience"
    dataScience.courseHeaderImage = "scienced"
    
    let python = CourseFlow()
    python.name = "PYTHON"
    python.courseType = "programming"
    python.courseTime = "night"
    python.coursesImage = "python-350"
    python.flowHeaderImage = "python-350"
    python.typeDescription = pythonDescription().typeDescription
    python.typeLevelDescriptiom = pythonDescription().typeLevelDescription
    python.courses = [pythonBase, pythonAdvanced, django, dataScience]
     return python
}
