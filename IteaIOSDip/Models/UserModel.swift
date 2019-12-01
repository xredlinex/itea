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
    var studentNextCourse: String?
    var studenCurrentCourse: String?
    var studentLastCourses: [String]?
    var workPlace: String?
    var studentCourses: [StudentCourses]?

}



class StudentCourses {
    var courseProgress: String?
    var courses: [Courses]?

}








//
//func coursesList() -> [Courses] {
//    
//    var list: [Courses] = []
//    
//    list = IteaCourse().makeCoursesFlow()
//
//    
//    
//    
//    
//    return []
//    
//    
//}
//
//
//class StudentFakeCourse {
//    
//    
//    
//    
//    
//    
//    
//}
