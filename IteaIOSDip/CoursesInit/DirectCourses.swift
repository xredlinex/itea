//
//  DirectCourses.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/18/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit


func makeCoursesDirect() -> [CourseDirection] {
    
    let qa = CourseDirection()
    qa.name = "ТЕСТИРОВАНИЕ"
    qa.courseType = "QA"
    qa.courseTime = "Вечерние"
    qa.coursesImage = "qa"
    qa.typeDescription = qaTypeDescription().typeDescription
    qa.typeLevelDescriptiom = qaTypeDescription().typeLevelDescription

    return [qa]
}








