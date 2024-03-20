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
        NavigationView {
                VStack(alignment: .leading) {
                    Text("Fintech")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    Image("Header")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .mask {
                            VStack(spacing: 0) {
                                LinearGradient(
                                    colors: [
                                        Color.black.opacity(1),
                                        Color.black.opacity(0.2),
                                    ],
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                            }
                        }
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
                            LoanInfoCard(title: "Interest", value: "\(safeModel.loanDetails.interestPaidToDate)")
                            LoanInfoCard(title: "Interest Rate", value: "\(safeModel.loanDetails.interestRate)%")
                            LoanInfoCard(title: "Loan ID", value: (safeModel.loanDetails.loanID))
                            NavigationLink(destination: PaymentDetailView(model: safeModel)) {
                                ButtonInfoCard(title: "→→→", value: "Next Payment", model: safeModel)
                            }
                        })
                        
                    }
                }
                .padding()
            
        }
    }
}

struct ProgressBarView: View {
    let loanDetails: LoanDetails
    
    var body: some View {
        let progress = (Float(loanDetails.amountBorrowed) - Float(loanDetails.remainingBalance)) / Float(loanDetails.amountBorrowed)
        
        VStack {
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
        .background(Color.indigo.gradient.opacity(0.7))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct ButtonInfoCard: View {
    let title: String
    let value: String
    let model: LoanModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            Text(value)
                .font(.body)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color.green.gradient.opacity(0.7))
        .cornerRadius(10)
        .shadow(radius: 2)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
