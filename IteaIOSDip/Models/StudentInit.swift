//
//  File.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/30/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

func makeIteaStudents() -> [IteaStudent] {
    let student = IteaStudent()
    student.name = "Alekseii"
    student.lastName = "Sorochan"
    student.password = "rediredi"
    student.mail = "redik.line@gmail.com"
    student.studentNextCourse = "1002"
    student.studenCurrentCourse = "1001"
    student.studentLastCourses = ["1000"]
    student.userPicture = "redi"
    student.phoneNumber = "+380630771072"
    return [student]
}
