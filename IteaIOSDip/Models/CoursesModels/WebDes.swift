//
//  WebDes.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 12/2/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

func makeWebDesign() -> CourseFlow {
 
    let designBase = Courses()
    designBase.courseName = "Основы дизайна и графические редакторы"
    designBase.courseDescription = webDeisignCoursesDescrioption()[0].courseDescriotion
    designBase.courseSkills = webDeisignCoursesDescrioption()[0].courseSkills
    designBase.courseProgram = webDeisignCoursesDescrioption()[0].courseProgram
    designBase.courseImage = "designBase"
    designBase.courseHeaderImage = "webDes-1"
    
    let graphic = Courses()
    graphic.courseName = "Графический дизайн"
    graphic.courseDescription = webDeisignCoursesDescrioption()[1].courseDescriotion
    graphic.courseSkills = webDeisignCoursesDescrioption()[1].courseSkills
    graphic.courseProgram = webDeisignCoursesDescrioption()[1].courseProgram
    graphic.courseImage = "graphic"
    graphic.courseHeaderImage = "webDes-1"
        
    let ux = Courses()
    ux.courseName = "UX Design"
    ux.courseDescription = webDeisignCoursesDescrioption()[2].courseDescriotion
    ux.courseSkills = webDeisignCoursesDescrioption()[2].courseSkills
    ux.courseProgram = webDeisignCoursesDescrioption()[2].courseProgram
    ux.courseImage = "ux"
    ux.courseHeaderImage = "webDes-1"
    
    let ui = Courses()
    ui.courseName = "UI Design"
    ui.courseDescription = webDeisignCoursesDescrioption()[3].courseDescriotion
    ui.courseSkills = webDeisignCoursesDescrioption()[3].courseSkills
    ui.courseProgram = webDeisignCoursesDescrioption()[3].courseProgram
    ui.courseImage = "ui"
    ui.courseHeaderImage = "webDes-1"
    
    let tilda = Courses()
    tilda.courseName = "Веб-дизайн на Tilda"
    tilda.courseDescription = webDeisignCoursesDescrioption()[4].courseDescriotion
    tilda.courseSkills = webDeisignCoursesDescrioption()[4].courseSkills
    tilda.courseProgram = webDeisignCoursesDescrioption()[4].courseProgram
    tilda.courseImage = "tilda"
    tilda.courseHeaderImage = "webDes-1"
       
    let webDes = CourseFlow()
    webDes.name = "ВЕБ-ДИЗАЙН"
    webDes.courseType = "design"
    webDes.courseTime = "night"
    webDes.coursesImage = "webdes"
    webDes.flowHeaderImage = "webdes"
    webDes.typeDescription = webDesignDescription().typeDescription
    webDes.typeLevelDescriptiom = webDesignDescription().typeLevelDescription
    webDes.courses = [designBase, graphic, ux, ui, tilda]
     return webDes
}
