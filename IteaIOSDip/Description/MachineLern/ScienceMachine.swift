//
//  ScienceMashine.swift
//  IteaIOSDip
//
//  Created by alexey sorochan on 12/2/19.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit


func dataDescription() -> CoursesTypeDescription {
    let data = CoursesTypeDescription()
    data.typeDescription = """
    — комплексная программа обучения, что призвана помочь специалистам решать задачи по сбору и анализу больших объемов информации с применением концепций Data Science и Machine Learning. На сегодняшний день это одно из самых прогрессивных направлений в сфере информационных технологий в виду необходимости обработки все большего количества данных и извлечения из них полезных свойств.
    После прохождения программы обучения вы будете иметь представление о технологии BigData, научитесь исследовать предметную область знаний и применять к ее обработке методы машинного обучения.
    """
    data.typeLevelDescription = """
    •    Принимать правильные бизнес решения при помощи Data Science и Machine Learning
    •    Применять концепции сбора, подготовки, исследования и визуализации данных
    •    Использовать современные методы машинного обучения для решения задач прогнозирования и классификации данных
    •    Сегментировать большие объемы данных при помощи алгоритмов машинного обучения
    •    Работать с основными инструментами Data Science
    •    Строить системы машинного обучения на основе данных большого объема с использованием BigData
    """
    return data
}

func dataScienceCoursesDescrioption() -> [CourseDescription] {
    let foundamentals = CourseDescription()
    foundamentals.courseDescriotion = """
    Возможности для специалистов Data Science - одной из самых перспективных профессий на сегодня - растут очень быстро в ответ на экспоненциальный рост объема собираемых и анализируемых данных. Компании нанимают Data Science инженеров для поиска скрытых закономерностей в данных и решения значимых бизнес задач. Получите современные знания и практические навыки, которые помогут вам успешно начать двигаться по пути Data Science специалиста.
    """
    foundamentals.courseSkills = """
    •    Исследовать предметную область в реальных бизнес задачах и предлагать решения с использованием концепций Data Science и Machine Learning
    •    Применять ключевые концепции сбора, подготовки, исследования и визуализации данных;
    •    Создавать решения на реальных практических примерах для разнородных данных с использованием платформы Microsoft Azure Machine Learning.
    •    Использовать современные методы машинного обучения для решения задач прогнозирования и классификации;
    •    Сегментировать большие данные, создавать рекомендационные модели для облегчения принятия стратегических решений.
    """
    foundamentals.courseProgram = """
    Введение в Data Science и Machine Learning
        •    Базовые понятия Big Data, Business Intelligence,  Data Mining, Data Science, Machine Learning, Artificial Intelligence
        •    История развития Data Science, современные перспективы
        •    Кто такой Data Scientist, навыки. Вопросы на собеседовании.
        •    Обзор процесса Data Science проекта
        •    Сценарии использования и применения ML в современном мире
        •    Обзор успешных проектов по Big Data и Machine Learning
    Data Science Process and Frameworks
        •    Планирование и подготовка работы
        •    Исторический обзор методологий ведения Data Science решений
        •    Детальный обзор современного Data Science процесса и его этапов
        •    Команда и роли специалистов в проектах Data Science
        •    Обзор популярных фреймворков и инструментов для Data Science решений
        •    Workshop 1: Этап Business Understanding
    Основы работы с системой контроля версий
    Предварительная обработка данных
        •    Загрузка исходных данных для анализа в систему (ETL)
        •    Data cleansing and transformation
        •    Data Sampling and Quantization
        •    Workshop 2: Подготовка данных для проекта
        •    Подходы и методики для визуализации данных
        •    Практика: Визуализация данных с помощью Power BI и R
    Прогнозирование и классификация
        •    Теоретический обзор проблемы и основных методов
        •    Введение в искусственные нейронные сети для решения различных задач
        •    Процесс создания реальных программных моделей для прогнозирования и классификации
        •    Оценка точности обученных моделей, выбор лучшей
        •    Workshop 3: Создание моделей прогнозирования и классификации
    Кластеризация и рекомендационные алгоритмы
        •    Теоретический обзор проблемы и основных методов
        •    Процесс создания реальных программных моделей для кластеризации, рекомендационных алгоритмов
        •    Оценка точности обученных моделей, выбор лучшей
        •    Введение в обработку естественного языка
        •    Workshop 4: Создание моделей кластеризации и рекомендационных моделей
    Имплементация моделей машинного обучения
        •    Временные ряды и прогнозирование событий
        •    Имплементация моделей машинного обучения для дальнейшего использования
        •    Обсуждение результатов выполнения домашних заданий
        •    Примеры архитектур полноценного проекта
        •    Workshop 5: Имплементация моделей машинного обучения
        •    Подведение итогов курса, презентация проектов
        •    Рекомендуемые материалы и шаги для дальнейшего изучения
    Защита курсового проекта

    """
    let bigData = CourseDescription()
    bigData.courseDescriotion = """
    В результате прохождения курса студенты овладеют современными методами и алгоритмами теории интеллектуального анализа больших данных и машинного обучения. Цель курса — формирование реальных навыков в анализе, обработке, поиске шаблонов и построении прогнозов на основе данных.
    """
    bigData.courseSkills = """
    •    анализировать и обрабатывать большие и сверхбольшие данные в различных форматах с целью поддержки принятия решений
    •    находить шаблоны в больших и сверхбольших базах данных и массивах текста
    •    строить прогнозы с использованием современных методов и алгоритмов интеллектуального анализа данных;
    •    использовать программное обеспечение для интеллектуального анализа данных в практической работе.
    """
    bigData.courseProgram = """
    •    Общие сведения о интеллектуальный анализ данных (ИАД) и машинное обучение
    ◦    Общие сведения о крупных данные и интеллектуальный анализ данных.
    ◦    Задачи ИАД. Обзор методов ИАД и машинного обучения
    ◦    Процесс ИАД. Подготовка данных.
    ◦    Практическое применение ИАД.
    •    Методы и алгоритмы классификации
    ◦    Методы построения деревьев решений. Методика «разделяй и властвуй».
    ◦    Алгоритм покрытия. Алгоритм CART.
    ◦    Байесивськи методы классификации.
    ◦    Построение математических функции классификации. Метод опорных векторов: линейный и нелинейный случаи.
    ◦    Системы с нечеткой логикой. Нечетко-нейронные системы. Настройка нечетко-нейронных систем.
    ◦    Решение практических задач классификации.
    •    Методы и алгоритмы кластеризации
    ◦    Иерархическая кластеризация: агломеративного и дивизимний алгоритмы. Методы соседства. Понятие дендрограммы.
    ◦    Статистические методы k-средних, ЭМ и их модификации.
    ◦    Методы кластеризации на основе теории графов. Алгоритмы нахождения минимального покрывающего дерева. Алгоритм Борувка.
    ◦    Алгоритм Форел и его модификации.
    ◦    Метод самоорганизующихся карт Кохонена. Метод стохастического градиента. Интерпретация карт.
    ◦    Анализ результатов кластеризации. Решение практических задач.
    •    Методы и алгоритмы построения ассоциативных правил. Секвенциальный анализ
    ◦    Общие сведения. Показатели полезности ассоциативных правил.
    ◦    Алгоритмы Apriori и FP-роста. Понятие FP-дерева (префиксного дерева).
    ◦    Шаблоны последовательностей. Алгоритм AprioriAll.
    ◦    Поиск ассоциативных правил в иерархиях данных. Алгоритм GSP.
    ◦    Решение практических задач поиска ассоциативных правил и шаблонов последовательностей.
    •    Ансамбли моделей ИАД
    ◦    Виды ансамблей. Понятие беггинга. Смесь моделей ИАД.
    ◦    Комбинирование результатов прогнозов, полученных моделями ИАД.
    ◦    Методы расчета коэффициентов относительной важности (весов) моделей в ансамбле.
    ◦    Понятие бустингу. Алгоритм AdaBoost. Обоснование бустинга. Градиентный бустинг.
    ◦    Сравнение моделей ИАД. Оценки эффективности и ошибок моделей. Lift- и Profit-кривые. ROC-анализ.
    •    Методы и алгоритмы анализа текстовой информации (text mining)
    ◦    Этапы text mining. Предварительная обработка документов. Выявление ключевых понятий. Аннотирование текстов.
    ◦    Методы категоризации (рубрикации) текстов.
    ◦    Методы поиска релевантных документов на основе множества запросов. Методы обучения ранжирование.
    ◦    Решение практических задач text mining.

    """
    let deep = CourseDescription()
       deep.courseDescriotion = """
        Курс направлен на изучение глубоких нейронных сетей. В ходе программы студенты рассмотрят state-of-the-art-модели, демонстрирующие наибольшую эффективность в решении специализированных задач. Материал разделен на три большие тематические блоки:
        •    Компьютерное зрение (2-8 модули)
        •    Обработка естественного языка (9-14 модули)
        •    Временные ряды (15-18 модули).
         
        Курс поможет начинающим специалистам по машинному обучению воплощать собственные решения задач компьютерного зрения, обработки естественного языка и прогнозирования временных рядов.
       """
       deep.courseSkills = """
        •    Использовать нейронные сети для решения реальных задач компьютерного зрения, обработки естественного языка и прогнозирования временных рядов
        •    Пользоваться библиотекой Tensorflow и Keras API
       """
       deep.courseProgram = """
        1.    Вступление Data science, Machine learning and deep learning
        •    Что такое нейронная сеть?
        •    Что делают нейроны?
        •    Простая нейронная сеть (персептрон).
        •    Создание простой нейронной сети.
        •    Forward Propagation и Backpropagation.
        2.    Современные нейронные сети
        •    Tensorflow и Keras.
        •    PyTorch.
        •    Создание простой нейронной сети с Keras.
        3.    Сверточные нейронные сети
        •    Слои в CNN.
        •    Feature learning.
        •    Простой классификатор изображений на Keras.
        •    Создание множественного классификатора.
        4.    Обработка изображений и их аугментация
        •    OpenCV.
        •    Аугментация в Keras.
        •    Albumentations.
        5.    Transfer Learning для классификации
        •    Главная идея transfer learning.
        •    ImageNet.
        •    LeNet.
        •    AlexNet.
        •    VGGNet.
        •    GoogLeNet.
        •    ResNet.
        •    ZFNet.
        6.    Выявление объектов
        •    R-CNN.
        •    SSD.
        •    YOLO.
        7.    Сегментация изображений
        •    Fully Convolutional Network (FCN).
        •    ParseNet.
        •    U-Net.
        •    Mask R-CNN.
        •    SSMA
        •    DeepLab.
        •    MinkowskiNet.
        8.    Генеративно-соревновательные нейронные сети
        •    Как работают GAN`ы.
        •    Neural style transfer.
        •    Autoencoders.
        •    Создание GAN в Keras.
        09.Обробка естественного языка
        •    Подготовка текстов.
        •    Задачи NLP: анализ тональности, реферирования текстов, генерация текстов, моделирование тем.
        •    Мешок слов.
        •    Тексты как последовательности.
        10.    Features engineering для NLP
        •    Tf-idf.
        •    Лемматизации и стемминг.
        •    N-grams.
        •    Создание признаков сходства.
        11.    Word Embeddings
        •    Word2vec.
        •    GloVe.
        •    fastText.
        12.    Sequence models
        •    LSTM.
        •    RNN.
        •    GRU.
        13.    Transfer Learning для NLP
        •    XLNet.
        •    BERT.
        •    NER-models.
        14.    Моделирование тем и реферирования текстов
        •    Классические LDA и LSA.
        •    lda2vec.
        •    Familia.
        15.    Автоматизация ответов на вопросы через нейронные сети
        •    QRN.
        •    Attentive LSTM.
        •    HyperQA.
        •    XLNet для ответов на вопросы.
        16.    Прогнозирование временных рядов с помощью нейронных сетей
        •    Обработка временных рядов.
        •    Подготовка признаков для временных рядов.
        •    Простые подходы к прогнозированию временных рядов.
        17.    Рекурентные нейронные сети для временных рядов
        •    LSTMs для одномерных временных рядов.
        •    LSTMs для многомерных временных рядов.
        18.    Улучшение глубоких нейронных сетей
        •    Оптимизация алгоритмов.
        •    Тюнинг гиперпараметров.
        •    Батч нормализация.
        19.    Tensorflow для продакшн.
        •    Tensorflow Extended (TFX).
        •    TF Serving.
        •    Flask.
        •    Apache.
        20.    Презентации курсовых проектов

       """



    return [foundamentals, bigData, deep]
}
