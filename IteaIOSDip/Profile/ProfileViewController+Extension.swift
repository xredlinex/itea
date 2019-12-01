//
//  ProfileViewController+Extension.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/30/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

//  MARK: - UPDATE USER INFO FIELDS



// MARK: - SHOW HIDE TOP BAR BUTTONS
extension ProfileViewController {
    func showCancelButton(show: Bool) {
        if show == true {
            backButton.isHidden = true
            cancelButton.isHidden = false
            backArrowLeftImageView.isHidden = true
            lastCourseButton.isHidden = true
        } else {
            backButton.isHidden = false
            cancelButton.isHidden = true
            backArrowLeftImageView.isHidden = false
            lastCourseButton.isHidden = false
        }
    }
}




//  MARK: - ADD NEXT BUTTON TO KEYBOARD -
extension ProfileViewController {
    func addNextButtonOnKeyboardAge() {
        let nextToolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        nextToolBar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let next = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextButtonActionAge))
        
        let item = [flexSpace, next]
        nextToolBar.items = item
        nextToolBar.sizeToFit()
        ageTextField.inputAccessoryView = nextToolBar
        }
    
    func addNextButtonOnKeyboardPhone() {
        
        let nextToolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        nextToolBar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let next = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextButtonActionPhone))
        
        let item = [flexSpace, next]
        nextToolBar.items = item
        nextToolBar.sizeToFit()
        phoneTextField.inputAccessoryView = nextToolBar
    }
    
    @objc func nextButtonActionAge(){
        cityTextField.becomeFirstResponder()
    }
        
    @objc func nextButtonActionPhone() {
        courentCourseTextField.becomeFirstResponder()
    }
}

// MARK: - FIND AND COMPARE FROM ALL COURSES -> STUDENT COURSES - SHITCODE -
extension ProfileViewController {
    
   func makeStudentCourses(courses: [CourseFlow], student: IteaStudent) -> [StudentCourses] {
        let nextCourses = StudentCourses()
        nextCourses.courseProgress = "Следующие Курсы"
        let currentCourse = StudentCourses()
        currentCourse.courseProgress = "Текущий Курс"
        let lastCourses = StudentCourses()
        lastCourses.courseProgress = "Пройденные Курсы"
            
        var nextCoursesArray: [Courses] = []
        var currentCoursesArray: [Courses] = []
        var lastCoursesArray: [Courses] = []
        
        var current = ""
        var next = ""
        var last: [String] = []
            
        if let some = student.studenCurrentCourse {
            current = some
        }
        if let some = student.studentNextCourse {
            next = some
        }
        if let some = student.studentLastCourses {
            last = some
        }
            
        for someNewCourses in courses {
            if someNewCourses.isProgrammingLanguage == true {
                if let flow = someNewCourses.programmingFlow {
                    for items in flow {
                        if let subFlow = items.courses {
                            for someNewItems in subFlow {
                                if current == someNewItems.courseID {
                                    currentCoursesArray.append(someNewItems)
                                }
                                if next == someNewItems.courseID {
                                    nextCoursesArray.append(someNewItems)
                                }
                                for items in last {
                                    if items == someNewItems.courseID {
                                        lastCoursesArray.append(someNewItems)
                                    }
                                }
                            }
                            
                        }
                    }
                }
            } else {
                for iteaCourses in courses {
                    if let studentCourses = iteaCourses.courses {
                        for someCourse in studentCourses {
                            if current == someCourse.courseID {
                                currentCoursesArray.append(someCourse)
                            }
                            if next == someCourse.courseID {
                                nextCoursesArray.append(someCourse)
                            }
                            for items in last {
                                if items == someCourse.courseID {
                                    
                                    lastCoursesArray.append(someCourse)
                    
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
        nextCourses.courses = nextCoursesArray
        lastCourses.courses = lastCoursesArray
        currentCourse.courses = currentCoursesArray
        return [currentCourse, nextCourses, lastCourses ]
    }
}
