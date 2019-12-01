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
    student.name = "Name"
    student.lastName = "Last NAME"
    student.password = "rediredi"
    student.mail = "redi@gmail.com"
    student.studentNextCourse = "1002"
    student.studenCurrentCourse = "1001"
    
        
    
    return [student]
}

//func makeStudentCourses() -> [StudentCourses] {
//    let nextCourses = StudentCourses()
//    nextCourses.courseProgress = "Следующий Курс"
//    nextCourses.courseIDList = ["1002"]
//
//    let previousCourses = StudentCourses()
//    nextCourses.courseProgress = "Предедущие Курсы"
//    nextCourses.courseIDList = ["", "", ""]
//    let currentCourses = StudentCourses()
//    nextCourses.courseProgress = "Текущий Курс"
//    nextCourses.courseIDList = ["1001"]
//
//    return [nextCourses, previousCourses, currentCourses]
//
//}













//func 1makeStudentCourses() -> [StudentCourses] {
//    let nextCourses = StudentCourses()
//    nextCourses.courseProgress = "Следующий Курс"
//    nextCourses.courseList = [makeOne()]
//
//    let currentCourse = StudentCourses()
//    currentCourse.courseProgress = "Текущий Курс"
//    currentCourse.courseList = [makeTwo()]
//
//   return [nextCourses, currentCourse]
//}
//
//class StudentFakeCourse {
//
//    func makecourse() -> [Courses] {
//
//       let one  = makeOne()
//        let two = makeTwo()
////        let three = makeThree()
//
//        return [one, two]
//    }
//}
//
//
//func makeOne() -> Courses {
//
//    let iosBase = Courses()
//    iosBase.courseName = "Базовый курс IOS"
//    iosBase.courseDescription = mobileCoursesDescrioption()[0].courseDescriotion
//    iosBase.courseSkills = mobileCoursesDescrioption()[0].courseSkills
//    iosBase.courseProgram = mobileCoursesDescrioption()[0].courseProgram
//    iosBase.courseImage = "iosBase"
//    iosBase.courseHeaderImage = "iosHeader"
//    return iosBase
//}
//
//func makeTwo() -> Courses {
//
//    let iosAdvanced = Courses()
//    iosAdvanced.courseName = "Продвинутый курс IOS"
//    iosAdvanced.courseDescription = mobileCoursesDescrioption()[1].courseDescriotion
//    iosAdvanced.courseSkills = mobileCoursesDescrioption()[1].courseSkills
//    iosAdvanced.courseProgram = mobileCoursesDescrioption()[1].courseProgram
//    iosAdvanced.courseImage = "iosAdvanced"
//    iosAdvanced.courseHeaderImage = "iosHeader"
//    return iosAdvanced
//
//}
