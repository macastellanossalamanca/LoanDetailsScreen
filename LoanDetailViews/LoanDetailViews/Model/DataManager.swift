//
//  DataManager.swift
//  LoanDetailViews
//
//  Created by Sandra Salamanca on 19/03/24.
//

import Foundation

struct DataManager {
    
    func loadJson(filename fileName: String) -> LoanModel? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(LoanModel.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
