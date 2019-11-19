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
    var birthday: Date?
    var mail: String?
    var password: String?
    var userPicture: String?
    var currentCourse: Courses?             /* OBJECT*/
    var completedCourses: [Courses]?        /* ARRAY OF OBJECTS*/
}



