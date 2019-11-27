//
//  Adnroid.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/27/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

func androidDescrioption() -> [CourseDescription] {
    let androidBase = CourseDescription()
    androidBase.courseDescriotion = """
        В ходе базового курса вы получите знания, которые помогут вам создавать интерфейсы и писать логику, которая скрывается за ними. Вы начнете понимать тренды мобильной разработки, узнаете о всех элементах и лайфхаках программирования под Android, необходимых в реальной жизни.
    """
    androidBase.courseSkills = """
        •    Понимать цикл создания приложения
        •    Понимать принципы верстки экранов приложения
        •    Понимать, что происходит под капотом с момента сборки приложения до закрытия и очистки из памяти
        •    Понимать тенденции новых библиотек, где их найти и как подключить
    """
    androidBase.courseProgram = """
        •    Введение
        ◦    Специфика операционной системы
        ◦    SDK/NDK, IDE, эмуляторы. Основы работы с Git
        ◦    Структура проекта
        ◦    Gradle
        ◦    Класс Application как точка входа в приложение
        ◦    Жизненный цикл приложения, Task
        •    Основные компоненты приложения
        ◦    Context
        ◦    Manifest
        ◦    Intent
        ◦    Activity
        ◦    Service
        ◦    ContentProvider
        ◦    BroadCast (Receiver)
        •    Ресурсы/Ассеты
        ◦    Строки (локализации)
        ◦    Размеры
        ◦    Изображения (Растр/Вектор)
        ◦    Стили
        ◦    View/ViewGroup
        ◦    Класс View
        ◦    Класс ViewGroup
        ◦    Краткий разбор наиболее популярных наследников View, ViewGroup
        •    Первое простое приложение
        ◦    XML-верстка
        ◦    Рендеринг xml, взаимодействие с элементами UI
        ◦    Action Bar
        ◦    Menu
        ◦    Dialog
        •    Навигация и взаимодействие экранов
        ◦    Углубленный разбор возможностей Intent
        ◦    Взаимодействие Activity
        ◦    Fragment
        ◦    BackStack, навигация, передача данных
        ◦    Списки
        ◦    Адаптеры
        ◦    ListView, GridView
        ◦    ViewHolder
        ◦    RecyclerView
        •    Асинхронное программирование в Android
        ◦    Thread
        ◦    Runnable
        ◦    Handler
        ◦    AsyncTask
        •    Локальные данные
        ◦    SharedPreference
        ◦    Работа с памятью
        ◦    Работа с базами данных (SQLite)
        •    Rest
        ◦    Основные принципы, HTTP/HTTPS-протоколы
        ◦    JSON
        ◦    Нативные инструменты
        •    Сервисы
        ◦    Сервис
        ◦    Intent Service
        •    Взаимодействие с ОС
        ◦    BroadCast/Broadcast Receiver
        ◦    Content Provider
        ◦    Планировщик, оповещения, widgets
        •    Архитектура
        ◦    Паттерны проектирования
        ◦    Популярные в Android поведенческие/порождающие паттерны
        ◦    SOLID
        ◦    MVP, MVVM, MVC
        •    Обзор популярных библиотек
        ◦    Gson
        ◦    Picasso/Glide
        ◦    Retrofit2
        ◦    ORM на примере Room (Google Architecture components)
    """
    let androidAdvanced = CourseDescription()
    androidAdvanced.courseDescriotion = """
        В ходе продвинутого изучения Android-программирования вы овладеете всеми тонкостями профессиональной разработки приложений и поймете, каким образом можно создавать быстрые и надежные клиент-серверные приложения. А по финалу курса разработаете свое Android-приложение. На финише курса вы будете иметь базовые знания для прохождения собеседования на позицию Junior Android Developer.
    """
    androidAdvanced.courseSkills = """
        •    Понимать полный цикл разработки приложения
        •    Уметь создавать клиент-серверные приложения
        •    Понимать, какая архитектура лучше и где именно
        •    Уметь пользоваться БД в Android с минимальными трудозатратами
        •    Понимать актуальные тенденции в мире Android
    """
    androidAdvanced.courseProgram = """
        •    CardView
        •    AppBarLayout
        ◦    Custom ToolBar
        •    Работа с системой контроля версий
        •    Custom Navigation Drawer
        •    Библиотека ButterKnife (ее подключение и применение)
        •    Библиотека Dagger2
        ◦    Разбор аннотаций @Provide, @Ingect, @Singleton
        ◦    Injection в конструктор
        ◦    Injection в метод
        ◦    Injection в поле
        ◦    Работа с Модулями и Саб-модулями
        •    Архитектура приложения. И почему MVP лучше.
        •    Retrofit2 и с чем его едят
        •    RxAndroid — базовые знания
        •    RxAndroid в сочетании с Retrofit2
        •    Библиотека Moxy
        •    Фоновая работа приложений. Сервисы Services
        ◦    Запуск и завершение работы сервисов. Жизненный цикл сервиса
        ◦    Синхронная работа сервисов
        ◦    Взаимодействие сервиса и активностей. Привязка сервисов
        •    Регистраторы системных событий BroascastReceiver
        •    Internet
        ◦    Формат JSON. Json-парсер
        ◦    Типы HTTP-запросов. GET-запрос. POST-запрос
        •    Геолокация
        •    База данных SQLite. Общие сведения
        ◦    Настройка и подключение базы к проекту
        ◦    Управление таблицами.
        •    База данных SQLite. Язык SQL. Классические запросы в базу
        ◦    Запросы INSERT, SELECT, UPDATE, DELETE. Класс Cursor
        •    База данных SQLite + RxAndroid
        •    Полезные ORM и какая из них лучше
        •    Карты GoogleMaps
        •    Социальные сети. Основные сведения

    """
    return [androidBase, androidAdvanced]
}
