//
//  FrontEnd.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 12/2/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

    func makeFrontEndCourses() -> CourseFlow {
        let htmlScc = Courses()
        htmlScc.courseDescription = JavaScriptCoursesDescrioption()[0].courseDescriotion
        htmlScc.courseSkills = JavaScriptCoursesDescrioption()[0].courseDescriotion
        htmlScc.courseProgram = JavaScriptCoursesDescrioption()[0].courseProgram
        htmlScc.courseName = "Курс HTML & CSS"
        htmlScc.courseHeaderImage = "html"
        htmlScc.courseImage = "htmlcss-1-min"
        
        let javaScriptBase = Courses()
        javaScriptBase.courseDescription = JavaScriptCoursesDescrioption()[1].courseDescriotion
        javaScriptBase.courseSkills = JavaScriptCoursesDescrioption()[1].courseDescriotion
        javaScriptBase.courseProgram = JavaScriptCoursesDescrioption()[1].courseProgram
        javaScriptBase.courseName = "JavaScript базовый курс"
        javaScriptBase.courseHeaderImage = "html"
        javaScriptBase.courseImage = "javascriptbase"
        
        let javaScriptAdvanced = Courses()
        javaScriptAdvanced.courseDescription = JavaScriptCoursesDescrioption()[2].courseDescriotion
        javaScriptAdvanced.courseSkills = JavaScriptCoursesDescrioption()[2].courseDescriotion
        javaScriptAdvanced.courseProgram = JavaScriptCoursesDescrioption()[2].courseProgram
        javaScriptAdvanced.courseName = "JavaScript продвинутый курс"
        javaScriptAdvanced.courseHeaderImage = "html"
        javaScriptAdvanced.courseImage = "javascriptAdvanced"
        
        let frontendAdvanced = Courses()
        frontendAdvanced.courseDescription = frontEndCoursesDescrioption()[0].courseDescriotion
        frontendAdvanced.courseSkills = frontEndCoursesDescrioption()[0].courseDescriotion
        frontendAdvanced.courseProgram = frontEndCoursesDescrioption()[0].courseProgram
        frontendAdvanced.courseName = "Frontend Advanced"
        frontendAdvanced.courseHeaderImage = "html"
        frontendAdvanced.courseImage = "frontendOne"
        
      let frontend = CourseFlow()
        frontend.name = "FRONTEND DEVELOPMENT"
        frontend.courseType = "front"
        frontend.courseTime = "night"
        frontend.coursesImage = "frontend-350"
        frontend.flowHeaderImage = "html"
        frontend.typeDescription = FrontEndDescription().typeDescription
        frontend.typeLevelDescriptiom = FrontEndDescription().typeLevelDescription
        frontend.courses = [htmlScc, javaScriptBase, javaScriptAdvanced, frontendAdvanced]
        
        
        
        return frontend
        
}

