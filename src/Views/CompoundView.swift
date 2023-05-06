import SwiftUI
import Foundation
import GLKit
import Charts

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
    
    struct CompoundCount: Identifiable {
        let id = UUID()
        let time: Int
        let interest: Int
    }
    
    
    let currentInterest: [CompoundCount] = [
        CompoundCount(time: 0, interest: 100),
        CompoundCount(time: 2, interest: 3000),
        CompoundCount(time: 3, interest: 2000),
        CompoundCount(time: 4, interest: 4500),
        CompoundCount(time: 5, interest: 9000)
    ]

    
    // Define Variables Here
    @State private var principleValue: String = ""    // The amount you want to borrow
    @State private var interestValue: String = ""     // The interest rate
    @State private var timeValue: String = ""              // Time value (days?)
    @State private var compoundInterestValue: String = ""
    
    
    
    // Alerts for fields
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    /**
     Start Body
     */
    // START BODY
    var body: some View {
        ZStack { // START ZSTACK
            ScrollView { // START SCROLLVIEW
                VStack { // START VSTACK
                    
                    // Principle Text Box
                    TextField("Enter principle (e.g. 10000)", text: $principleValue)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 5)
                    
                    // Interest Text Box
                    TextField("Enter interest (e.g. 7.99)", text: $interestValue)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 5)
                    
                    // Time Text Box
                    TextField("Enter time period (e.g. 7)", text: $timeValue)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 5)
                    Spacer()
                    Divider()
                        .padding(20)
                    
                    GroupBox ("Compound Interest") {
                        Chart {
                            ForEach(currentInterest) {
                                LineMark(
                                    x: .value("Time", $0.time),
                                    y: .value("Interest", $0.interest)
                                )
                            }
                        } // END CHART
                        .onTapGesture {
                            print("Chart tapped! Do something.") // TODO
                        }
                    }
                    
                    
                    Divider()
                        .padding(20)
                    Spacer()
                    Button(action: calculatePressed, label: {
                        Text("Calculate".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: 200)
                            .background(Color.green)
                            .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .shadow(radius: 10)
                    }) // END BUTTON
                } // END VSTACK   
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
            } // END SCROLLVIEW
            
            
            
        } // END ZSTACK
        .navigationTitle("Compoundify")
        
    } // END BODY
    
    func calculatePressed() {
        /** logic:
         Convert obtained string values to numbers (max time period is 1000)
            Then run the first script:
              var Amount = Principal * pow((1 + Rate/100), TimeInterval)
         Save amount to array[x] = Y axis
         Save timeinteral to no. of days
         Output to graph
         
         --> might need to perform async background task
         */
    }
    
    // error checking
    /**
     textIsAppropriate()
     Check and see if the number of characters is appropriate
     */
    func textIsAppropriate() -> Bool {
        if principleValue.count == 0 {
            alertTitle = "Enter a princple value first"
            showAlert.toggle()
            return false
        }
        if interestValue.count == 0 {
            alertTitle = "Enter an interest value first"
            showAlert.toggle()
            return false
        }
        if timeValue.count == 0 {
            alertTitle = "Enter a time value first"
            showAlert.toggle()
            return false
        }

        return true
    }
}
