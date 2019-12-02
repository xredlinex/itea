//
//  JavaScript.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 12/2/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

func makeJavaScriptCourses() -> CourseFlow {
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
    
    let javaScriptProfessional = Courses()
    javaScriptProfessional.courseDescription = JavaScriptCoursesDescrioption()[3].courseDescriotion
    javaScriptProfessional.courseSkills = JavaScriptCoursesDescrioption()[3].courseDescriotion
    javaScriptProfessional.courseProgram = JavaScriptCoursesDescrioption()[3].courseProgram
    javaScriptProfessional.courseName = "JavaScript Professional"
    javaScriptProfessional.courseHeaderImage = "html"
    javaScriptProfessional.courseImage = "javascriptprofessional"
    
    
    let javaScript = TypesOfProgrammingFlow()
    javaScript.name = "Java Script"
    javaScript.flowImage = "html"
    javaScript.courses = [htmlScc, javaScriptBase, javaScriptAdvanced, javaScriptProfessional]
    
    
    let reactJs = Courses()
    reactJs.courseDescription = reactJSCoursesDescrioption()[0].courseDescriotion
    reactJs.courseSkills = reactJSCoursesDescrioption()[0].courseDescriotion
    reactJs.courseProgram = reactJSCoursesDescrioption()[0].courseProgram
    reactJs.courseName = "React.js"
    reactJs.courseHeaderImage = "react"
    reactJs.courseImage = "React_JS"
    
    let reactBase = Courses()
    reactBase.courseDescription = reactJSCoursesDescrioption()[1].courseDescriotion
    reactBase.courseSkills = reactJSCoursesDescrioption()[1].courseDescriotion
    reactBase.courseProgram = reactJSCoursesDescrioption()[1].courseProgram
    reactBase.courseName = "React Native (базовый)"
    reactBase.courseHeaderImage = "react"
    reactBase.courseImage = "react-base"
    
    let reactAdvanced = Courses()
    reactAdvanced.courseDescription = reactJSCoursesDescrioption()[2].courseDescriotion
    reactAdvanced.courseSkills = reactJSCoursesDescrioption()[2].courseDescriotion
    reactAdvanced.courseProgram = reactJSCoursesDescrioption()[2].courseProgram
    reactAdvanced.courseName = "JReact Native (продвинутый)"
    reactAdvanced.courseHeaderImage = "react"
    reactAdvanced.courseImage = "react-adv"
    
    
    let react = TypesOfProgrammingFlow()
    react.name = "React"
    react.flowImage = "react"
    react.courses = [reactJs, reactBase, reactAdvanced]
    
    let angularBase = Courses()

    angularBase.courseDescription = angularCoursesDescrioption()[0].courseDescriotion
    angularBase.courseSkills = angularCoursesDescrioption()[0].courseDescriotion
    angularBase.courseProgram = angularCoursesDescrioption()[0].courseProgram
    angularBase.courseName = "Angular 8 Base"
    angularBase.courseHeaderImage = "940x454-angular"
    angularBase.courseImage = "angularBase"
    
    let vueJs = Courses()
    vueJs.courseDescription = angularCoursesDescrioption()[1].courseDescriotion
    vueJs.courseSkills = angularCoursesDescrioption()[1].courseDescriotion
    vueJs.courseProgram = angularCoursesDescrioption()[1].courseProgram
    vueJs.courseName = "Vue.js"
      vueJs.courseHeaderImage = "940x454-angular"
      vueJs.courseImage = "vue"
    
    let nodeJs = Courses()
    nodeJs.courseDescription = angularCoursesDescrioption()[2].courseDescriotion
    nodeJs.courseSkills = angularCoursesDescrioption()[2].courseDescriotion
    nodeJs.courseProgram = angularCoursesDescrioption()[2].courseProgram
    nodeJs.courseName = "Node.js"
    nodeJs.courseHeaderImage = "940x454-angular"
    nodeJs.courseImage = "nodejs-1-min"
    
    let angularProfessional = Courses()
    angularProfessional.courseDescription = angularCoursesDescrioption()[3].courseDescriotion
    angularProfessional.courseSkills = angularCoursesDescrioption()[3].courseDescriotion
    angularProfessional.courseProgram = angularCoursesDescrioption()[3].courseProgram
    angularProfessional.courseName = "Angular 8 Professional"
    angularProfessional.courseHeaderImage = "940x454-angular"
    angularProfessional.courseImage = "angular8"
    
    let angular = TypesOfProgrammingFlow()
    angular.name = "Angular"
    angular.flowImage  = "nodeangular"
    angular.courses = [angularBase, vueJs, nodeJs, angularProfessional]
    
    let js = CourseFlow()
    js.name = "JS DEVELOPMENT"
    js.courseType = "programming"
    js.courseTime = "night"
    js.coursesImage = "roadmap_javascript"
    js.flowHeaderImage = "roadmap_javascript"
    js.typeDescription = JavaScriptDescription().typeDescription
    js.typeLevelDescriptiom = JavaScriptDescription().typeLevelDescription
    js.isProgrammingLanguage = true
    js.programmingFlow = [javaScript, react, angular]
    
    return js
}

