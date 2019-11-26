//
//  Mobile.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

func makeMobileCourses() -> CourseFlow {
    
    let iosBase = Courses()
    iosBase.courseName = "Базовый курс IOS"
    iosBase.courseDescription = mobileCoursesDescrioption()[0].courseDescriotion
    iosBase.courseSkills = mobileCoursesDescrioption()[0].courseSkills
    iosBase.courseProgram = mobileCoursesDescrioption()[0].courseProgram
    iosBase.courseImage = "iosBase"

    let iosAdvanced = Courses()
    iosAdvanced.courseName = "Продвинутый курс IOS"
    iosAdvanced.courseDescription = mobileCoursesDescrioption()[1].courseDescriotion
    iosAdvanced.courseSkills = mobileCoursesDescrioption()[1].courseSkills
    iosAdvanced.courseProgram = mobileCoursesDescrioption()[1].courseProgram
    iosAdvanced.courseImage = "iosAdvanced"
    
    let ios = TypesOfProgrammingFlow()
    ios.name = "IOS"
    ios.flowImage = "ios"
    ios.courses = [iosBase, iosAdvanced]
    
    let androidBase = Courses()
    androidBase.courseName = "Программирование под Android (базовый)"
    androidBase.courseImage = "android-base"
    
    let androidAdvanced = Courses()
    androidBase.courseName = "Программирование под Android (продвинутый)"
    androidBase.courseImage = "android-adv"
    
    let android = TypesOfProgrammingFlow()
    android.name = "Android"
    android.flowImage = "android"
    android.courses = [androidBase, androidAdvanced]
    
    let mobile = CourseFlow()
    mobile.name = "Mobile development"
    mobile.courseType = "programming"
    mobile.courseTime = "night"
    mobile.coursesImage = "mobile_development"
    mobile.flowHeaderImage = "mobile_development"
    mobile.typeDescription = mobileTypeDescription().typeDescription
    mobile.typeLevelDescriptiom = mobileTypeDescription().typeLevelDescription
    mobile.isProgrammingLanguage = true
    mobile.programmingFlow = [ios, android]
    
    return mobile
}
