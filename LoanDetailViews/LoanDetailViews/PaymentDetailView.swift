//
//  PaymentDetailView.swift
//  LoanDetailViews
//
//  Created by Sandra Salamanca on 20/03/24.
//

import SwiftUI

struct PaymentDetailView: View {
    @State var model: LoanModel?
    var body: some View {
        VStack {
            Text("Payment Details")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            Image("silverCoin")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(alignment: .bottomLeading) {
                    VStack(alignment: .leading) {
                            Text("Due in \(model?.paymentDetails.dueInDays ?? 0) days")
                                .foregroundColor(Color.gray)

                            Text("$\(model?.paymentDetails.amountDue ?? 0)")
                                .font(.largeTitle)

                        }
                        .padding()
                        .scaledToFit()
                }
            VStack {
                Image("mastercard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(alignment: .trailing) {
                        Text("\(model?.loanDetails.lastFourPaymentCard ?? "0000")")
                            .padding()
                    }
            }
            .opacity(0.9)
            
            HStack {
                Text("Next Payment")
                    .foregroundColor(Color.gray)
                Text("$" + String(model?.loanDetails.remainingBalance ?? 00))
                    .bold()
                Spacer()
                Text(String(model?.paymentDetails.paymentProgress.currentPaymentNumber ?? 0))
                    .bold()
                Text("of \(model?.paymentDetails.paymentProgress.totalPayments ?? 0) payments")
            }
            .font(.system(size: 17))
            .padding()
            
            Button(value: "Make a payment →")
                .padding()
            
        }
    }
}

struct Button: View {
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(value)
                .font(.title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .padding()
        .background(Color.green.gradient.opacity(0.6))
        .cornerRadius(20)
        .shadow(radius: 2)

    }
}

struct PaymentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDetailView()
    }
}
