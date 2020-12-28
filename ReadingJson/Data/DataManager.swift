//
//  DataManager.swift
//  ReadingJson
//
//  Created by Phan Nguyen on 28/12/2020.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    func loadData() -> [Student] {
        if let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Student].self, from: data)
                return dataFromJson
            } catch {
                print(error)
            }
        }
        return [Student]()
    }
}
