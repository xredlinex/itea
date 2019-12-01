//
//  LastCoursesViewController.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/22/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class LastCoursesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var student = IteaStudent()
//    var courses = StudentCourses()
//    var recieveCourses = StudentCourses()
    var recieveStudentInfo = IteaStudent()
    
    var flow: [CourseFlow] = []
    var studentCourses = [StudentCourses]()
  
    
    
//    var studentCourses = [StudentCourses]()
    override func viewDidLoad() {
        super.viewDidLoad()
        student = recieveStudentInfo
        flow = IteaCourse().makeCoursesFlow()
        

        
        studentCourses = makeStudentCourses(courses: flow, student: student)
        debugPrint(studentCourses.count)
        
   

        tableView.register(UINib(nibName: "CoursesTableViewCell", bundle: nil), forCellReuseIdentifier: "CoursesTableViewCell")
        tableView.reloadData()
        backgroundView(image: "profileBg", color: UIColor.init(red: 19/255, green: 58/255, blue: 85/255, alpha: 1), alpha: 0.7)
    }
    
    @IBAction func didTapGoBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
}

extension LastCoursesViewController {
    
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
//                debugPrint(current)
            }
            if let some = student.studentNextCourse {
                next = some
//                debugPrint(next)
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

extension LastCoursesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return studentCourses.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentCourses[section].courses?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableViewCell") as! CoursesTableViewCell
        if let course = studentCourses[indexPath.section].courses {
            cell.updateCourseInfo(course: course[indexPath.row])
        }
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let label = UILabel(frame: view.frame)
        label.text = studentCourses[section].courseProgress
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.layer.backgroundColor = UIColor(red: 19/255, green: 58/255, blue: 85/255, alpha: 1).cgColor
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = label.text?.uppercased()
        view.addSubview(label)
        return view
    }
}


extension LastCoursesViewController : CoursesTableViewCellProtocol {
    func courseInfo(index: Int) {
        let storyboard = UIStoryboard(name: "Courses", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailedCourseViewController") as! DetailedCourseViewController
    
  
        viewController.recieveCourse = studentCourses
        
//        viewController.recieveCourse =
//        viewController.recieveCourse = studentCourses[]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
