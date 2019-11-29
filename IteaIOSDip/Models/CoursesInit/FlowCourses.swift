//
//  FlowCourses.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/18/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class IteaCourse {
    
    func makeCoursesFlow() -> [CourseFlow] {
        let qa = makeQaCourses()
        let mobile = makeMobileCourses()
        let javaProgramming = makeJsProgrammingCourses()
        let cplus = makeCPlusProgrammingCourses()
        
        return [mobile, qa, javaProgramming, cplus]
    }
}






