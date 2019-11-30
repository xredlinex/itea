//
//  UserModel.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/18/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class IteaStudent {
    var name: String?
    var lastName: String?
    var age: Int?
    var city: String?
    var birthday: String?
    var mail: String?
    var phoneNumber: String?
    var password: String?
    var userPicture: String?
    var studentCourses: [StudentCourses]?
    var studenCurrentCourse: String?
    var workPlace: String?
    
    
//    var nextCourse: [Courses]?  /* OBJECT*/
//    var completedCourses: [Courses]?       /* ARRAY OF OBJECTS*/
}


func makeIteaStudents() -> [IteaStudent] {
    let student = IteaStudent()
    student.name = "Name"
    student.lastName = "Last NAME"
    student.password = "rediredi"
    student.mail = "redi@gmail.com"
    return [student]
}


class StudentCourses {
    var nextCourse: [Courses]?
    var completedCourse: [Courses]?
    var currentCourse = Courses()
    
    
    init(nextCourse: [Courses], completedCourses: [Courses]) {
        self.nextCourse = nextCourse
        self.completedCourse = completedCourses
    }
}




//func studentCourse() -> [StudentCourse] {
//
//    let nextCourses = StudentCourse()
//    nextCourses.courses = []
//    let completedCourse = StudentCourse()
//    completedCourse.courses = []
//
//    return [nextCourses, completedCourse]
//}

