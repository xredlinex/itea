//
//  JavaDescription.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 11/23/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import Foundation

func javaProgrammingTypeDescription() -> CoursesTypeDescription {
    let javaProgramming = CoursesTypeDescription()
    javaProgramming.typeDescription = """
    Курсы программирования Java — современная комплексная программа обучения языку Java.
    Java – популярный язык программирования, на котором кодят игровые и мобильные приложения, десктоп-программы и огромное количество soft-продуктов для предприятий.
    Программа обучения Java состоит из взаимосвязанных уровней, после изучение которых вы получите знания и навыки Java-разработки уровня Junior-специалиста.
    Java-разработчик – это перспективно и выгодно. IТ-компании предлагают начинающему разработчику зарплату от 300 $, комфортные условия труда, интересные проекты и карьерный рост! Пройдя Java-обучения вы получите работу своей мечты!
    """
    javaProgramming.typeLevelDescription = """
    Разрабатывать приложения и внедрять аппликации в рамках платформы JavaSE
    Использовать основные элементы и конструкции языка JavaSE, архитектурные и проектировочные приемы в рамках платформы
    Писать загрузчики классов
    Разрабатывать небольшие IoС-контейнеры
    Писать модульные тесты и работать по TDD
    Понимать, что скрывается за понятием Java Memory Model
    """
    return javaProgramming
}

func javaProgrammingCoursesDescrioption() -> [CourseDescription] {


    let javaBase = CourseDescription()
    javaBase.courseDescriotion = """
    Базовый курс Java предназначен для студентов, которые хотят научиться программированию на Java с нуля. В ходе уроков вы научитесь разработке и настройке приложений, познакомитесь с основными элементами технологии и конструкциями языка Java Standard Edition. На курсе вы освоите основы web-программирования и узнаете о сетевых возможностях Java для начинающих.

    Под руководством преподавателя вы изучите основы программирования на Java, которые помогут самостоятельно написать и представить программный проект.
    """
    javaBase.courseSkills = """
    Разрабатывать, проводить отладку приложений и внедрять аппликации в рамках платформы JavaSE
    Использовать основные элементы технологии и конструкции языка JavaSE, архитектурные и проектировочные приемы в рамках платформы.
    Перейти на расширенный курс обучения

    """
    javaBase.courseProgram = """
       Общая характеристика языка Java
        История языка Java
        Байт-код
        Виртуальная машина Java (JVM)
        Трансляция, интерпретация и компиляция
        JIT-компиляция
        JDK и его структура
        Команды JDK: javac, java, appletviewer, jar (en10)
        Их использование и параметры
        Поиск и загрузка классов
        Создание и запуск первого приложения на Java
        Выход из программы и завершения ее работы
        Использование IDE Eclipse/NetBeans/Intellij IDEA для создания и выполнения программ
        Типы данных и основные операции с ними
        Алфавит языка
        Комментарии
        Ключевые слова
        Типы данных: простые(примитивные) и по ссылке
        Идентификаторы, выбор имен идентификаторов
        Переменные и константы
        Объявления и инициализация переменных
        Область видимости и время жизни переменных
        Операторы
        Операции: арифметические, присваивания, отношения и логические
        Преобразование и приведение числовых типов
        Приоритет операций
        Использование круглых скобок
        Поток управления
        Составной оператор (блок)
        Условный оператор и его виды
        Оператор switch
        Циклы: for, while, do while
        Бесконечные циклы
        Прерывание потока управления, метки
        Оператор goto и причины почему его не следует применять
        Массивы
        Объявления и инициализация массивов, в т.ч. анонимных
        Линейные массивы
        Итерация по элементам массива
        Массивы и присвоения
        Передача и возврат массивов в/из методов
        Копирование массивов
        Класс Arrays: заполнение, сравнение элементов и их сортировка
        Поиск в массивах
        Многомерные массивы, «неравные» массивы
        Методы: аргументы переменной длины
        Параметры командной строки
        Строки
        Класс String. Неизменные объекты
        Хранение строк в памяти
        Основные операции класса String (создание, конкатенация, сравнение, поиск символов и подстрок в строках и др.). Преобразование простых типов данных
        Разбивка строк: класс StringTokenizer. Переменные объекты: классы StringBuffer и StringBuilder
        Основные методы. StringBuffer vs StringBuilder
        Основы работы с системой контроля версий
        Введение в ООП. Объекты и классы
        Поля и методы (определение, синтаксис объявления)
        Спецификаторы доступа public и private
        Поля классов: инициализация явная и по умолчанию, спецификатор final и константы
        Доступ к полям и методам
        Методы: параметры (ссылки и простые типы) и возвращаемые, использование set и get- методов, перезагрузки методов, правила перезагрузки
        Объектная модель. Основные положения: абстрагирование, инкапсуляция, модульность, иерархия
        Диаграммы классов UML.
        Объекты и классы. Объекты. Определение (с примерами). Состояние. Поведение.
        Конструкторы: конструкторы по умолчанию, вызов одного конструктора из другого
        Блоки инициализации
        Статические поля и методы: инициализация константы, статические блоки инициализации. Использование this для доступа к членам класса
        Сбор мусора и удаления объектов
        Отношение между объектами
        Зависимости, их разновидности
        Обобщение
        Ассоциации
        Реализации
        Связи, их множественность
        Наследование и полиморфизм
        Наследование и полиморфизм как инструмент создания ПО. Суперкласс и подклассы, отношение обобщения, наследование в Java. Вызов конструкторов суперклассов, порядок вызовов. Ключевое слово super ()
        Переопределение методов, правила переопределения. Наследование и статические поля и методы классов. Абстрактные классы и методы, – понятие, вызов конструкторов, реализация методов в субклассы
        Интерфейсы. «Множественное» наследование. Определение и реализация интерфейсов. Расширение интерфейсов. Композиция как альтернатива множественному наследованию
        Полиморфизм. Иерархия наследования
        Преобразование и приведение типов. Использование instanceof. Отказ от наследования: терминальные (final) методы и классы. Включение как альтернатива множественному наследованию
        Пакеты. Вложенность пакетов. Повторное использование кода и пакеты. Защита доступа.
        Импорт: классов, статических методов и полей
        Класс Object
        Глобальный суперкласс Object
        Методы equals (), hashCode (), toString (), finalize (), clone () и др
        Правила реализации equals () и hashCode ()
        Интерфейс Cloneable и его реализация
        Клонирование: поверхностное и глубокое
        Внутренние классы.
        Синтаксис объявления
        Создание объектов внутренних классов
        Поля и методы внутренних классов
        Вложенность внутренних классов и доступ к членам внешних классов
        Ссылка this во внутреннем классе
        Доступ к полям и методам внешнего класса с внутреннего
        Внутренние классы и спецификаторы доступа
        Вложенные интерфейсы
        Применение внутренних классов
        Внутренние локальные классы (Method-LocalInnerClasses)
        Анонимные внутренние классы
        Вложенные (внутренние статические) классы (static nested classes)
        Создание экземпляров
        Доступ к экземпляру внешнего класса
        Компиляция программ с внутренними классами
        Перечисление
        Перечисление как классы. Методы values (), valueof (), name (), ordinal ().
        Константы, конструкторы, методы и поля
        Перечисление и конструкция switch. Импорт членов перечислений
        Работа с базами данных
        Основы построения реляционных баз данных.
        SQL
        Нормальные формы. Запросы SELECT, INSERT, UPDATE, DELETE
        JDBC
        Driver, Connection, Statement, ResultSet, PrepareStatement
        Обработка ошибок и исключения
        Подходы к обработке ошибок времени выполнения
        Понятие исключения и исключительной ситуации
        Иерархия классов исключений в Java
        Контролируемые (что проверяются) и неконтролируемые (не проверяются) исключения
        Генерация исключительной ситуации и оператор throws
        Объявления контролируемых исключений, ключевое слово throws
        Throws и перезагрузки методов
        Перехват исключений
        Перехват «всех» исключений
        Обработка исключений
        Повторная генерация исключений
        Блок finally: освобождение ресурсов
        Создание собственной иерархии исключений
        Регистрация ошибок, логирования: логеры, уровень логгер, уровень сообщений, обработчики (объекты подкласса java.util.logging.Handler)
        Пример
        Система ввода-вывода
        Иерархия классов потокового ввода-вывода:
        Потоки ввода/вывода, механизм работы с потоками, иерархия потокового ввода-вывода
        Субклассы FilterOutputStream и FilterInputStream
        Байтовые потоки
        Символьные потоки
        Класс File. Класс RandomAccessFile
        Сериализация и десериализация объектов: понятие, назначение, реализация
        Пример
        Desktop-приложения
        SWING, AWT. Пример простого приложения с GUI
        Обработка событий
        Классы коллекций
        Понятие абстрактного типа данных (АТД)
        Структуры данных: списки, стеки, множества, дерева, карты
        Обход коллекций: интерфейсы Iteratorта и ListIterator, цикл «foreach»
        Компараторы
        Класс Collections: поиск и сортировка элементов, заполнения, синхронизование представления, неизменные представления и др.
        Знакомство с XML
        Понятие формальной корректности и допустимости.
        Парсинг, хранение состояние объектов
        Примеры
        Многопоточность
        Понятие потока. Особенности параллельного выполнения
        Потоки-демоны
        Приоритеты потоков. Метод yield ()
        Состояние потока: создание потоков, -runnable и -runninig – потоки
        Классы BigInteger и BigDecimal. Основные операции
        Документирование кода
        Включение комментариев
        Документирование пакетов
        Дескрипторы общего назначения
        Комментарии к классам, методам и полей
        Использование javadoc
        Универсальные типы
        Параметризованные типы: классы и интерфейсы. Параметры типа
        Ограничения, наложенные на параметризованные типы: простые типы, инстанцирование, суперкласс, исключение.
        Параметризованные типы и JVM

    """
    let javaAdvanced = CourseDescription()
    javaAdvanced.courseDescriotion = """
    Цель курса Java Core Advanced Topics – подготовить студентов к решению более серьезных задач при программировании на языке Java. Данный курс будет полезен Java Junior Developers, а также тем, кто уже знаком с Java Core и хотел бы получить дополнительные практические знания по ряду тем. Вы получите необходимые для работы в реальных проектах навыки и поймете, что лежит в основе многих популярных фреймворков, как они работают. Вы ознакомитесь с архитектурой платформы JVM internals, изучите Java Reflection, Java Generics и Java Annotations.
    """
    javaAdvanced.courseSkills = """
    Программировать на языке Java на высоком уровне
    Написать свой загрузчик классов
    Разработать небольшой IoC-контейнер (маленький Spring)
    Писать модульные тесты и работать по TDD
    Понимать, что скрывается за понятием Java Memory Model, без чего невозможно писать правильные многопоточные приложения

    """
    javaAdvanced.courseProgram = """
       Программа курса:
       Утилитные пакеты
       Форматирование и время java.util, java.time
       Файловая система, java.io, Externalizable, java.nio
       Java 8. Lambda expressions. Stream API
       GIT. Контроль версий. Локальные системы контроля версий. Централизованные системы контроля версий. Распределённые системы контроля версий
       Maven. Автоматизация сборки Java проектов. Декларативное описание проекта. Управление зависимостями. Артефакты jar, war, ear. Правила разработка собственных фреймворков и библиотек
       Ant the Java legacy build tool
       Maven POM
       Модульное тестирование
       JUnit. Правила и принципы
       TDD
       Дублеры
       Mockito, PowerMock
       Java Annotations
       Java Reflection
       Advanced Generics
       Причины улучшение подсистемы типов
       Raw Types
       Wildcards, ? super T, ? exteds T
       Type Erasure
       Получение информации о generic типе в runtime
       Доработка собственной коллекции
       Advanced Collections
       Data Structure Complexity
       WeakHashMap etc.
       Сторонние библиотеки коллекций
       Advanced MultithreadingConcurrency
       Низкоуровневое API
       waiting / blocked / sleeping-потоки, состояние потока dead
       Получение результатов выполнения многопоточных вычислений. Метод join()
       Синхронизация: синхронизация методов, синхронизационные блоки. Блокировки. Взаимодействие потоков (ThreadInteraction)
       Синхронизация потоков, взаимодействие потоков, шаблон Producer-Consumer
       Особенность реализации volatile
       Java Memory Model (JMM)
       Публикация объектов.
       Высокоуровневое API
       Библиотека java.util.concurrent
       Advanced OOP
       SOLID (basic principles of object-oriented programming and design). Dependency injection (DI) and Inversion of control (IoC)
       GOF patterns
       JRE Security, JVM internals: архитектура платформы, байт-код, class loader, garbage collector, средства JVM для защищенного исполнения кода
       Sandbox
       Memory Management
       Performance Optimization
       Роль JAAS
       Desktop приложения
       JavaFX runtime
       Свойства и связывания
       Наблюдаемые коллекции
       Управление окнами и сценами
       Узлы и стилизация.
       Обработка событий.
       Доступные графические компоненты
       Concurrency: Worker, Task, Service
       FXML
       Spring
       Inversion of Control
       Доступ к данным
       Управление транзакциями
       Работа с XML и JSON
       JAXP. Потоковый анализ на основе SAX. Анализ на основе DOM
       JAXB. Генерация Java-классов по схеме
       JSON. Валидация
       JDBC
       Пул соединений
       Data Access Object
       ЭкзаменЗащита программного проекта

    """
    let javaWebApps = CourseDescription()
       javaWebApps.courseDescriotion = """
        Вы познакомитесь со Spring Core и спецификацией Java Persistence API (JPA). Рассмотрите, что представляют из себя Servlet container и базовая технология для формирования отображения Java Server Pages (JSP). Затем перейдете к изучению Spring MVC и стандартной архитектуре веб-приложений. Рассмотрите RESTful веб-сервисы, на основе которых сейчас создаются современные приложения. В завершение узнаете, как организован процесс разработки приложений с использованием систем Continuous Integration. Во время курса Вы разработаете учебное веб-приложение в соответствии с шаблоном MVС, взаимодействующее с СУБД с помощью JPA. Далее перепишете его на основе Spring MVC и добавите в него поддержку RESTful веб-сервисов.
       
       """
       javaWebApps.courseSkills = """
        Разрабатывать приложения
        Приступить к дальнейшему профессиональному изучению Spring Core, SpringMVC и ORM-фреймворков
       """
       javaWebApps.courseProgram = """
            Maven/Ant build tools
            Building with  dependencies and resources
            Creating box(production) version
            War-archive
            SOLID (basic principles of object-oriented programming and design)
            Dependency injection (DI) and Inversion of control (IoC)
            Java  beans
            Apache Tomcat
            Installation,first run, short guide
            Java Server Pages.Model 1
            Overview
            Syntax
            Java code on JSP, imports
            Java Server Pages.Model 2. Expression Language
            Overview
            Syntax
            Additional tags
            GET, POST methods
            Using DataBases
            Connecting  to MySQL
            Authorization and registration forms
            Forms error checking
            Working with GIT
            Using beans in EL
            Understanding of Model
            Adding front-end: Integrating templates into project
            Sessions
            Login-Logout script
            Manage users
            User data protection
            Servlets
            Web Container
            Servlet container
            Life cycle of a servlet
            Filters
            Web.xml
            MVC (model-view-controller)
            JSP+Servlet
            MVC pattern
            Data Connection Pool
            Spring: Framework
            Overwiew
            Creating beans
            xml style vs annotations style
            Spring MVC
            DispatcherServlet
            Context Hierarchy
            Web MVC Config
            Building and deploying  spring-mvc WAR
            Objects relational mapping (ORM)
            Java Persistence API (JPA)
            Hibernate framework
            Adding to project other technologies
            JavaScript
            JSON (JavaScript Object Notation)
            AJAX (asynchronous JavaScript and XML)
            SOAP and RestFull
            Overview
            RESTful Web Service on SpringBoot
               
       """
    
    let scalaProgramming = CourseDescription()
       scalaProgramming.courseDescriotion = """
        Цель курса – научить студентов программированию на языке Scala. Курс предназначен для тех, кто уже владеет основами разработки на Java (или на другом языке) и понимает принципы ООП.
        
        В ходе уроков вы научитесь разработке, отладке и настройке приложений на Scala, познакомитесь как с функциональными, так и с объектно-ориентированными конструкциями языка. Вы получите знания, необходимые для изучения таких популярных фреймворков, как Spark, Play Framework, Akka и углубиться в работу с BigData и Web-разработкой.
       """
       scalaProgramming.courseSkills = """
        Использовать функциональные и объектно-ориентированные конструкции языка Scala
        Разрабатывать и проводить отладку Scala-приложений
        Собирать Scala-проекты с помощью SBT
        Тестировать написанный код
        Начать изучение фреймворков: Spark, Play Framework, Akka и др.
       """
       scalaProgramming.courseProgram = """
            Общая характеристика Scala
                    История языка
                    Байт-код
                    Виртуальная машина (JVM)
                    Поиск и загрузка классов
                    Создание и запуск приложения на Scala
                    Использование IDE для создания и выполнения Scala-программ
                    Чтение-вычисление-вывод/REPL — read-eval-print loop
                    Особенности реализации
                    Основные функции
                    Power-мод
                    Переменные в Scala
                    Values
                    Variables
                    Операторы
                    Типы операторов
                    Создание и использование
                    Порядок очередности
                    Строки
                    Создание строк и работа с ними
                    Интерполяция
                    “s” интерполятор
                    “f” интерполятор
                    “raw” интерполятор
                    Типы данных
                    Иерархия типов
                    Type inference
                    Типы Any, AnyVal, AnyRef
                    Тип Nothing
                    Scala Null
                    Функции и методы
                    Функция и метод
                    Side effect, pure functions
                    Рекурсия
                    Функции высшего порядка (Higher-order functions)
                    Анонимные функции
                    Частичные функции
                    Частичное применение функций
                    Currying
                    Функциональные комбинаторы
                    Классы и объекты
                    ООП в Scala
                    Класс
                    Объект
                    Companion object
                    Сопоставление с образцом (Pattern matching)
                    Сопоставление с образцом: литералы
                    Сопоставление с образцом: классы
                    Сопоставление с образцом: коллекции
                    Запечатанные (Sealed) классы
                    Кейс класс
                    Кейс объект
                    Вложенный класс
                    Trait
                    Примеси и множественное наследование
                    Обобщения
                    Валидация
                    Package & package
                    Монады в Scala
                    Определение монады
                    Монады в коллекциях
                    Монада “Option”, класс “Some” и объект “None”
                    For-comprehension
                    Обработка исключений
                    Как работают исключения в Scala
                    Иерархия исключений
                    Способы обработки исключений
                    Массивы
                    Создание и использование массивов
                    Одномерные массивы
                    Многомерные массивы
                    Операции над массивами
                    Коллекции
                    Иерархия коллекций
                    Кортежи/Tuple
                    Списки/List
                    Коллекции неповторяющихся элементов /Set
                    Последовательности упорядоченных элементов /Seq
                    Карты/Map
                    Объект Nil
                    Обход коллекций, операции над коллекциями
                    Сравнение производительности коллекций
                    Implicits
                    Неявные параметры
                    Неявные преобразования
                    Неявные классы
                    Type classes
                    Future
                    Определение, создание и использование
                    Callbacks
                    Projections
                    Promises
                    SBT (Scala Build Tool)
                    Testing
       """
    
    return [javaBase, javaAdvanced, javaWebApps, scalaProgramming]
}