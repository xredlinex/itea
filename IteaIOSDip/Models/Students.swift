//
//  Students.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/19/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

func makeIteaStudents() -> [IteaStudent] {
    let studentOne = IteaStudent()
    studentOne.name = "Student One Name"
    studentOne.lastName = "Student One Last Name"
    studentOne.age = 35
    studentOne.city = "Kyiv"
//    studentOne.birthday =
    studentOne.mail = "mail@gmail"
    studentOne.password = "45qwerty"
    studentOne.userPicture = "studentOne"
    studentOne.currentCourse = makeQaCourses()[3].courseName
//    studentOne.completedCourses = [makeQaCourses()[1].courseName, makeQaCourses()[0].courseName]
    
    return [studentOne]
}

