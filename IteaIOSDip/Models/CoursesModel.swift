//
//  CoursesModel.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/18/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class CourseFlow {
    var name: String?
    var courses: [Courses]?
    var courseType: String?
    var courseTime: String?
    var coursesImage: String?
    var typeDescription: String?
    var typeLevelDescriptiom: String?
}

class Courses {
    var courseName: String?
    var courseDescription: String?
    var courseSkills: String?
    var courseProgram: String?
    var courseImage: String?
    
}

class CoursesTypeDescription {
    var typeDescription: String?
    var typeLevelDescription:String?
}

class CourseDescription: CoursesTypeDescription {
    var courseDescriotion: String?
    var courseSkills: String?
    var courseProgram: String?
}




