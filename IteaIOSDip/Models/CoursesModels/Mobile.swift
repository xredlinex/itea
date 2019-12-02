//
//  Mobile.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

func makeMobileCourses() -> CourseFlow {
    
    let fundomentals = Courses()
    fundomentals.courseName = "Основы Программирования"
    fundomentals.courseDescription = phpCoursesDescrioption()[0].courseDescriotion
    fundomentals.courseSkills = phpCoursesDescrioption()[0].courseSkills
    fundomentals.courseProgram = phpCoursesDescrioption()[0].courseProgram
    fundomentals.courseImage = "fundomentals"
    fundomentals.courseHeaderImage = "fundHeader"
    fundomentals.courseID = "1000"
    
    let iosBase = Courses()
    iosBase.courseName = "Базовый курс IOS"
    iosBase.courseDescription = mobileCoursesDescrioption()[0].courseDescriotion
    iosBase.courseSkills = mobileCoursesDescrioption()[0].courseSkills
    iosBase.courseProgram = mobileCoursesDescrioption()[0].courseProgram
    iosBase.courseImage = "iosBase"
    iosBase.courseHeaderImage = "iosHeader"
    iosBase.courseID = "1001"

    let iosAdvanced = Courses()
    iosAdvanced.courseName = "Продвинутый курс IOS"
    iosAdvanced.courseDescription = mobileCoursesDescrioption()[1].courseDescriotion
    iosAdvanced.courseSkills = mobileCoursesDescrioption()[1].courseSkills
    iosAdvanced.courseProgram = mobileCoursesDescrioption()[1].courseProgram
    iosAdvanced.courseImage = "iosAdvanced"
    iosAdvanced.courseHeaderImage = "iosHeader"
    iosAdvanced.courseID = "1002"
    
    let ios = TypesOfProgrammingFlow()
    ios.name = "IOS"
    ios.flowImage = "ios"
    ios.courses = [iosBase, iosAdvanced]
    
    let androidBase = Courses()
    androidBase.courseName = "Программирование под Android (базовый)"
    androidBase.courseDescription = androidDescrioption()[0].courseDescriotion
    androidBase.courseSkills = androidDescrioption()[0].courseSkills
    androidBase.courseProgram = androidDescrioption()[0].courseProgram
    androidBase.courseImage = "android-base"
    androidBase.courseHeaderImage = "androidHeader"
    
    let androidAdvanced = Courses()
    androidAdvanced.courseName = "Программирование под Android (продвинутый)"
    androidAdvanced.courseDescription = androidDescrioption()[1].courseDescriotion
    androidAdvanced.courseSkills = androidDescrioption()[1].courseSkills
    androidAdvanced.courseProgram = androidDescrioption()[1].courseProgram
    androidAdvanced.courseImage = "android-adv"
    androidAdvanced.courseHeaderImage = "androidHeader"
    
    let android = TypesOfProgrammingFlow()
    android.name = "Android"
    android.flowImage = "android"
    android.courses = [androidBase, androidAdvanced]
    
    
    let basic = TypesOfProgrammingFlow()
    basic.name = "Основы Программирования"
    basic.flowImage = "fundHeader"
    basic.courses = [fundomentals]
    
    let mobile = CourseFlow()
    mobile.name = "Mobile development"
    mobile.courseType = "programming"
    mobile.courseTime = "night"
    mobile.coursesImage = "mobile_development"
    mobile.flowHeaderImage = "mobile_development"
    mobile.typeDescription = mobileTypeDescription().typeDescription
    mobile.typeLevelDescriptiom = mobileTypeDescription().typeLevelDescription
    mobile.isProgrammingLanguage = true
    mobile.programmingFlow = [basic, ios, android]
    
     return mobile
}
