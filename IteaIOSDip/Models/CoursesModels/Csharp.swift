//
//  Csharp.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 12/2/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit


func makeCshapr() -> CourseFlow {
    
    let fundomentals = Courses()
    fundomentals.courseName = "Основы Программирования"
    fundomentals.courseDescription = phpCoursesDescrioption()[0].courseDescriotion
    fundomentals.courseSkills = phpCoursesDescrioption()[0].courseSkills
    fundomentals.courseProgram = phpCoursesDescrioption()[0].courseProgram
    fundomentals.courseImage = "fundomentals"
    fundomentals.courseHeaderImage = "fundHeader"
    fundomentals.courseID = "1000"
 
    let base = Courses()
    base.courseName = "Базовый курс C# /.NET"
    base.courseDescription = sharpCoursesDescrioption()[0].courseDescriotion
    base.courseSkills = sharpCoursesDescrioption()[0].courseSkills
    base.courseProgram = sharpCoursesDescrioption()[0].courseProgram
    base.courseImage = "csharpbase"
    base.courseHeaderImage = "sharpheader"
      
    let avanced = Courses()
    avanced.courseName = "Продвинутый курс C# /.NET"
    avanced.courseDescription = sharpCoursesDescrioption()[1].courseDescriotion
    avanced.courseSkills = sharpCoursesDescrioption()[1].courseSkills
    avanced.courseProgram = sharpCoursesDescrioption()[1].courseProgram
    avanced.courseImage = "csharpadv"
    avanced.courseHeaderImage = "sharpheader"
        
    let net = Courses()
    net.courseName = "Веб-разработка на .NET Core"
    net.courseDescription = sharpCoursesDescrioption()[2].courseDescriotion
    net.courseSkills = sharpCoursesDescrioption()[2].courseSkills
    net.courseProgram = sharpCoursesDescrioption()[2].courseProgram
    net.courseImage = "net"
    net.courseHeaderImage = "sharpheader"
       
    let csharp = CourseFlow()
    csharp.name = "C# /.NET DEVELOPMENT"
    csharp.courseType = "programming"
    csharp.courseTime = "night"
    csharp.coursesImage = "roadmap_csharp"
    csharp.flowHeaderImage = "roadmap_csharp"
    csharp.typeDescription = ccharpDescription().typeDescription
    csharp.typeLevelDescriptiom = ccharpDescription().typeLevelDescription
    csharp.courses = [fundomentals, base, avanced, net]
     return csharp
}


