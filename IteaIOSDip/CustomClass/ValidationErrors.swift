//
//  ValidationErrors.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/29/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ValidationErrors {

    enum ErrorTextEnum {

        case invalidFirstName
        case invalidLastName
        case invalidPhoneNumber
        case invalidEmail
        case noEmail
        case emailExists
        case invalidPassword
        case phoneExists
        case passwordNotMatch
        case invalidFirstNameLastName
        case emptyFields
        case error
    }

    func errorKey(_ error: ErrorTextEnum) -> String {
        switch error {
        case .invalidFirstName:
           return "Пожалуйста, введите правильное имя."
        case .invalidLastName:
            return "Пожалуйста, введите правильную фамилию."
        case .invalidPhoneNumber:
            return "Пожалуйста, введите действительный номер мобильного телефона."
        case .invalidEmail:
            return "Пожалуйста, введите действительный адрес электронной почты."
        case .noEmail:
            return "Адрес электронной почты не найден!"
        case .invalidPassword:
            return "Пожалуйста, введите действительный пароль."
        case .emailExists:
            return "Эта почта уже зарегистрирована"
        case .phoneExists:
            return "Этот номер мобильного телефона уже зарегистрирован. Вы хотели войти? Если вы забыли свой адрес электронной почты или пароль, свяжитесь с нами."
        case .passwordNotMatch:
            return "Не совпадают введеные пароли."
        case .invalidFirstNameLastName:
            return "Пожалуйста, введите правильно имя и фамилию."
        case .emptyFields:
            return "Чтоб продолжить заполните все поля!"
        case .error:
            return "Ошибка!"
        }
    }
}

