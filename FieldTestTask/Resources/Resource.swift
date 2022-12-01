//
//  Resource.swift
//  FieldTestTask
//
//  Created by Alexey Gaidykov on 01.12.2022.
//

import Foundation

enum Resource {
    enum NameFields: String, CaseIterable {
        case firstName = "Имя"
        case secondName = "Фамилия"
        case thirdName = "Отчесво"
        case dateBirthday = "Дата рождения"
        case gender = "Пол"
    }
}
