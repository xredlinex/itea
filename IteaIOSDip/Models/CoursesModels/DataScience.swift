//
//  DataScience.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 12/2/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

func makeDataScience() -> CourseFlow {
 
    let dataScience = Courses()
    dataScience.courseName = "Data Science/Machine Learning Fundamentals"
    dataScience.courseDescription = dataScienceCoursesDescrioption()[0].courseDescriotion
    dataScience.courseSkills = dataScienceCoursesDescrioption()[0].courseSkills
    dataScience.courseProgram = dataScienceCoursesDescrioption()[0].courseProgram
    dataScience.courseImage = "dataScience"
    dataScience.courseHeaderImage = "dataHeader"
      
    let bigData = Courses()
    bigData.courseName = "Big Data"
    bigData.courseDescription = dataScienceCoursesDescrioption()[1].courseDescriotion
    bigData.courseSkills = dataScienceCoursesDescrioption()[1].courseSkills
    bigData.courseProgram = dataScienceCoursesDescrioption()[1].courseProgram
    bigData.courseImage = "Big Data"
    bigData.courseHeaderImage = "dataHeader"
    
    let pythonDataScience = Courses()
    pythonDataScience.courseName = "Python/R for Data science"
    pythonDataScience.courseDescription = pythonCoursesDescrioption()[3].courseDescriotion
    pythonDataScience.courseSkills = pythonCoursesDescrioption()[3].courseSkills
    pythonDataScience.courseProgram = pythonCoursesDescrioption()[3].courseProgram
    pythonDataScience.courseImage = "dataScience"
    pythonDataScience.courseHeaderImage = "scienced"
        
    let deep = Courses()
    deep.courseName = "Deep Learning"
    deep.courseDescription = dataScienceCoursesDescrioption()[2].courseDescriotion
    deep.courseSkills = dataScienceCoursesDescrioption()[2].courseSkills
    deep.courseProgram = dataScienceCoursesDescrioption()[2].courseProgram
    deep.courseImage = "Deep Learning"
    deep.courseHeaderImage = "dataHeader"
       
    let dataScienceAndMachine = CourseFlow()
    dataScienceAndMachine.name = "DATA SCIENCE/MACHINE LEARNING"
    dataScienceAndMachine.courseType = "programming"
    dataScienceAndMachine.courseTime = "night"
    dataScienceAndMachine.coursesImage = "roadmap_data_science"
    dataScienceAndMachine.flowHeaderImage = "roadmap_data_science"
    dataScienceAndMachine.typeDescription = dataDescription().typeDescription
    dataScienceAndMachine.typeLevelDescriptiom = dataDescription().typeLevelDescription
    dataScienceAndMachine.courses = [dataScience, bigData, pythonDataScience, deep]
     return dataScienceAndMachine
}

