//
//  LoanViewModel.swift
//  LoanDetailViews
//
//  Created by Miguel Castellanos on 19/03/24.
//

import Foundation

class LoanViewModel: ObservableObject {
    let fileName = "loanInfo"
    let dataManager = DataManager()
    @Published var loanModel: LoanModel?
    
    init() {
        loanModel = dataManager.loadJson(filename: fileName)
    }
}
