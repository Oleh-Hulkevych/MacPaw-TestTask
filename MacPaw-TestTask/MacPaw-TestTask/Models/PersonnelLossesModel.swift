//
//  PersonnelLossesModel.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 27.08.2023.
//

import Foundation

struct PersonnelLossesModel: Identifiable, Decodable {
    let id = UUID()
    let date: String
    let day: Int
    let personnel: Int
    let personnelLossesModelPersonnel: String
    let pow: Int?

    enum CodingKeys: String, CodingKey {
        case date
        case day
        case personnel
        case personnelLossesModelPersonnel = "personnel*"
        case pow = "POW"
    }
}
