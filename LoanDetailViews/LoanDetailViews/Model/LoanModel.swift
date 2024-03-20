//
//  LoanModel.swift
//  LoanDetailViews
//
//  Created by Miguel Castellanos on 19/03/24.
//

import Foundation

import Foundation

struct PaymentProgress: Codable {
    let currentPaymentNumber: Int
    let totalPayments: Int
}

struct PaymentDetails: Codable {
    let dueInDays: Int
    let amountDue: Float
    let nextPaymentDate: String
    let paymentProgress: PaymentProgress
}

struct LoanDetails: Codable {
    let loanID: String
    let remainingBalance: Float
    let amountBorrowed: Float
    let interestPaidToDate: Float
    let interestRate: Float
    let maxCreditAmount: Float
    let repaymentDay: Int
    let lastFourPaymentCard: String
    let numberOfDocuments: Int
}

struct LoanModel: Codable {
    let email: String
    let paymentDetails: PaymentDetails
    let loanDetails: LoanDetails
}
