//
//  DataManager.swift
//  ReadingJson
//
//  Created by Phan Nguyen on 28/12/2020.
//

import Foundation

class DataLoader {
    
    var studentData = [Student]()
    
    init(){
        loadData()
    }
    
    func loadData() {
        if let fileLocation = Bundle.main.url(forResource: "data", withExtension: "geojson") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Student].self, from: data)
                self.studentData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}
