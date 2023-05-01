import SwiftUI
import Foundation
import GLKit

/*
print("Please enter the principal amount-")
var Principal = Float(readLine()!)!
print("Please enter the rate of interest-")
var Rate = Float(readLine()!)!
print("Please enter the time period-")
var TimeInterval = Float(readLine()!)!

var Amount = Principal * pow((1 + Rate/100), TimeInterval)

var CI = Amount - Principal

print("Entered Principal is-", Principal)
print("Entered Interest rate is-", Rate)
print("Entered Time interval is-", TimeInterval)
print("--------------")
print("Amount is-", Amount)
print("Compound interest is-", CI)
*/

// CompoundView
struct CompoundView: View {
    
    // Define Variables Here
    @State private var principleValue: String = ""    // The amount you want to borrow
    @State private var interestValue: String = ""     // The interest rate
    @State private var timeValue: String = ""              // Time value (days?)
    
    // Brief UI Design
    // Enter principle amount
    // Enter interest rate
    // Enter time period (how many days?)
    // Graph below
    // Calculate button
    
    /**
     Start Body
     */
    var body: some View {
        ZStack {
            VStack {
                TextField("Enter principle (e.g. 10000)", text: $principleValue)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(.vertical)
                
                TextField("Enter interest (e.g. 7.99)", text: $interestValue)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(.vertical)
                
                TextField("Enter time period (e.g. 7)", text: $timeValue)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(.vertical)
                
                Divider()
                    .padding(20)
                
                Text("Graph Goes Here")
                    .padding()
                
                Button(action: calculatePressed, label: {
                    Text("Calculate".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: 200)
                        .background(Color.green)
                        .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .shadow(radius: 10)
                })
            }   
            
            
            
        }
        .navigationTitle("Compoundify")
    }
    
    func calculatePressed() {
        // do something
    }
}
