//
//  React.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 12/2/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

// MARK DESCRIPTION
//func ReactDescription() -> CoursesTypeDescription {
//    let react = CoursesTypeDescription()
//    react.typeDescription = """
//    """
//    react.typeLevelDescription = """
//    """
//    return some
//}

func reactJSCoursesDescrioption() -> [CourseDescription] {
    let reactJs = CourseDescription()
    reactJs.courseDescriotion = """
    В ходе курса вы познакомитесь с принципиально новым и инновационным подходом в формировании страниц сайтов и приложений, сможете увидеть и принять участие в процессе разработки полноценного SPA (single page aplication), а также усовершенствуешь навыки работы с JavaScript.
    """
    reactJs.courseSkills = """
    •    Проектировать и строить полноценное приложение или продвинутый сайт на фреимворке React.js
    •    Использовать последние новинки современной верстки JSX и "Виртуальный DOM" в своей работе
    """
    reactJs.courseProgram = """
    •    Введение в экосистему фреймворка React
    ◦    Императивное и декларативное программирование
    ◦    Различные паттерны, применяемые с фреймворками
    ◦    Плюсы использования фреймворка
    •    Настройка первого React-компонента с использованием NPM, Babel, Webpack
    •    Работа с "props"/"state" компонента
    •    JSX
    •    React Router
    •    Работа с событиями
    •    Жизненный цикл компонента + AJAX, работа с модулем axios
    •    Reusable Components
    •    Redux
    •    Динамический рендеринг
    •    Работа с формами
    •    Использование Promises
    •    Деплой приложения

    """
    let reactNative = CourseDescription()
    reactNative.courseDescriotion = """
    Программа базового уровня позволит познакомиться с тонкостями использования фреймворка React Native. React Native предлагает ряд интегрированных компонентов, что позволяет разработчикам быстро и эффективно выполнять основные задачи.
    """
    reactNative.courseSkills = """
       •    Разрабатывать простые приложения с использованием основных функций фреймворка React Native
    •    Работать с удаленными данными и визуальными компонентами
    """
    reactNative.courseProgram = """
    •    Введение
    ◦    О курсе
    ◦    Обзор технологии React
    ◦    Обзор технологии React Native
    ◦    Актуальность мобильной разработки
    ◦    WebView. Гибридные приложения или нативные приложения
    •    Настройка окружения
    ◦    Windows
    ◦    Mac
    ◦    Linux
    •    Основы работы с React Native
    ◦    Проблемы при настройке среды для работы
    ◦    Структура проекта
    ◦    «Hello, World!» на React Native
    ◦    React vs React Native
    ◦    Создание компонентов с JSX
    ◦    Единый компонент, как точка входа для обеих платформ
    •    Стилизация приложения
    ◦    Написание стилей для React Native
    ◦    Введение во FlexBox
    ◦    Создание стилизированных компонентов
    ◦    Повторное использование компонентов и стилей
    •    Получение удаленных данных
    ◦    HTTP
    ◦    Шаблон компонента «Список»
    ◦    Классо-ориентированные компоненты
    ◦    Методы жизненного цикла компонента
    ◦    Получение данных средствами React Native
    ◦    Состояние компонента
    ◦    Визуализация списка компонента
    ◦    Компоненты для множественного использования - «Карточка»
    ◦    Стилизация «Карточки»
    ◦    Передача компонента в свойства
    •    Работа с визуальными компонентами
    ◦    Картинки
    ◦    Контент, который скроллится
    ◦    Кнопки
    ▪    Обработка событий
    ▪    Стилизация кнопок
    ◦    Работа со слоями
    ◦    Вкладки
    •    Обработка данных
    ◦    Процесс логина
    ◦    Обработка ошибок
    ◦    Создание анимации-загрузки
    ◦    Условный рендеринг JSX
    ◦    Работа с формой
    ◦    Обработка событий авторизации
    •    Redux
    ◦    Основы функционального программирования
    ◦    Flux
    ◦    Основы Redux
    ◦    Шаблоны и реализации
    •    Создание приложения
    ◦    Header-приложения
    ◦    ListView
    ◦    Рендеринг одной строки данных
    ◦    Стилизация списков
    ◦    Reducer
    ◦    Элементы, реагирующие на касания
    ◦    Вынесение логики с компонентов
    ◦    Анимация
    ◦    Тестирование
    •    Обработка данных React vs Redux
    ◦    Форма логирования в Redux-мире
    ◦    Обновление формы авторизации
    ◦    Неизменность состояния (Immutable State)
    ◦    Синхронные и асинхронные действия
    ◦    Введение в Redux Thunk
    ◦    Создания профиля пользователя
    •    Навигация

    """
    let reactAdvanced = CourseDescription()
       reactAdvanced.courseDescriotion = """
        Этот курс создан для разработчиков, не желающих останавливаться на достигнутом. Продвинутая программа обучения затронет такие темы, как: работа с анимацией, настройка push-оповещений, запоминание паролей, оффлайн-обработка информации, облачные сервисы, консоль разработки Facebook и другие. Курс профессиональной разработки на React Native направлен на углубленное изучение принципов и методик создания мобильных приложений на этой платформе.
       """
       reactAdvanced.courseSkills = """
        •    Разрабатывать приложения с полным функционалом, работая с продвинутыми функциями React Native
        •    Использовать и настраивать кроссплатформенные push-оповещения для пользователей
        •    Работать с компонентами MapView и определять местонахождение пользователей
        •    Внедрять в приложения динамичные и анимированные переходы
       """
       reactAdvanced.courseProgram = """
        •    Работа с анимациями
        ◦    Система анимаций
        ◦    Модуль анимаций
        ◦    Простейшие анимации
        ◦    Движение Круга
        ◦    Взаимодействие компонентов
        ◦    Кастомизация индивидуальных карточек
        •    Обработка жестов
        ◦    Система отзывов на жесты
        ◦    Обработчики событий экрана
        ◦    Объект "Жест"
        ◦    Перетаскивание карточек
        •    Применение анимационных стилей
        ◦    Анимирование одной карточки
        ◦    Поворот элементов
        ◦    Интерполяция значений поворота
        ◦    Определение минимальных дистанций для свайпа
        ◦    Колбеки на свайпы
        •    Одноразовая авторизация по паролю
        ◦    Обзор обычного процесса авторизации
        ◦    Одноразовый пароль в деталях
        ◦    Обычный сервер против Google Cloud Functions
        ◦    Настройка проекта Firebase
        ◦    Объект запроса и ответа
        •    Facebook-аутентификация
        ◦    Процесс Facebook-аутентификации
        ◦    Консоль разработчика Facebook
        ◦    Настройка Redux
        ◦    Асинхронное хранение данных
        ◦    Логирование в Facebook
        •    Работа с информацией в offline
        ◦    Push-уведомления и сохранение данных
        ◦    Сохранение состояния приложения
        ◦    Redux-хранение данных
        •    Push-оповещения
        ◦    Обзор Push-оповещений
        ◦    Регистрация Push-оповещений
        ◦    Генерация Push-оповещений
        ◦    Тестирование
        •    MapViews на React Native

       """
    
    return [reactJs, reactNative, reactAdvanced]
}