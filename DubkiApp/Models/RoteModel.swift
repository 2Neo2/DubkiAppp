//
//  RoteModel.swift
//  DubkiApp
//
//  Created by Иван Доронин on 12.01.2023.
//

import Foundation

struct RoteModel: Identifiable, Codable {
    var id: Int
    var day: String
    var dayTime: Int64
    var dayTimeString: String
    var direction: String
    var station: String
}
