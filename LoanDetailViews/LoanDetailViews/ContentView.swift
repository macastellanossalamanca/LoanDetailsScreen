//
//  ContentView.swift
//  LoanDetailViews
//
//  Created by Miguel Castellanos on 19/03/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = LoanViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            Text("Fintech")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            Image("Header")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .shadow(radius: 2)
            Text("""
                 Loan
                 Details
                """)
                .font(.largeTitle)
                .padding(.bottom, 20)
                .gridColumnAlignment(.leading)
            
            
            ProgressBarView(loanDetails: viewModel.loanModel!.loanDetails)
                .padding(.bottom, 20)
            
            if let safeModel = viewModel.loanModel {
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], content: {
                    LoanInfoCard(title: "Interés Pagado", value: "\(safeModel.loanDetails.interestPaidToDate)")
                    LoanInfoCard(title: "Tasa de Interés", value: "\(safeModel.loanDetails.interestRate)%")
                    LoanInfoCard(title: "ID del Préstamo", value: (safeModel.loanDetails.loanID))
                    LoanInfoCard(title: "→→→", value: "Next Payments")
                        .onTapGesture {
                            print("Pressed")
                        }
                })
                
            }
        }
        .padding()
    }
}

struct ProgressBarView: View {
    let loanDetails: LoanDetails
    
    var body: some View {
        let progress = (Float(loanDetails.amountBorrowed) - Float(loanDetails.remainingBalance)) / Float(loanDetails.amountBorrowed)
        
        VStack {
            Text("Progreso de Pago")
                .font(.headline)
                .padding(.bottom, 10)
            HStack {
                Text("Left")
                    .foregroundColor(Color.gray)
                Text("$" + String(loanDetails.remainingBalance))
                    .bold()
                Spacer()
                Text("Amount Borrowed")
                    .foregroundColor(Color.gray)
                Text("$" + String(loanDetails.amountBorrowed))
                    .bold()
            }
            .font(.system(size: 13))
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10.0)
                        .foregroundColor(Color.gray.opacity(0.3))
                        .frame(width: geometry.size.width, height: 20)
                    RoundedRectangle(cornerRadius: 10.0)
                        .foregroundColor(Color.green)
                        .frame(width: min(CGFloat(progress)*geometry.size.width, geometry.size.width), height: 20)
                }
            }
        }
    }
}

struct LoanInfoCard: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            Text(value)
                .font(.body)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color.pink.gradient.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
