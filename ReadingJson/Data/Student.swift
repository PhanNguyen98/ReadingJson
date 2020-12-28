//
//  Student.swift
//  ReadingJson
//
//  Created by Phan Nguyen on 28/12/2020.
//

import Foundation

struct Student: Codable {
    var info: Info
    var avatar: String?
    var studentID: String
    enum CodingKeys: String, CodingKey {
        case info
        case avatar
        case studentID = "student_id"
    }
}

struct Info: Codable {
    var name: String
    var birthday: String
}
