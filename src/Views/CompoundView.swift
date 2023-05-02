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
    
    struct StepCount: Identifiable {
        let id = UUID()
        let weekday: Date
        let steps: Int
        
        init(day: String, steps: Int) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMdd"
            
            self.weekday = formatter.date(from: day) ?? Date.distantPast
            self.steps = steps
        }
    }
    
    
    let currentWeek: [StepCount] = [
        StepCount(day: "20220717", steps: 4200),
        StepCount(day: "20220718", steps: 15000),
        StepCount(day: "20220719", steps: 2800),
        StepCount(day: "20220720", steps: 10800),
        StepCount(day: "20220721", steps: 5300),
        StepCount(day: "20220722", steps: 10400),
        StepCount(day: "20220723", steps: 4000)
    ]

    
    // Define Variables Here
    @State private var principleValue: String = ""    // The amount you want to borrow
    @State private var interestValue: String = ""     // The interest rate
    @State private var timeValue: String = ""              // Time value (days?)
    @State private var compoundInterestValue: String = ""
    
    
    
    // Alerts for fields
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
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
            ScrollView {
                VStack {
                    
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
                            ForEach(currentWeek) {
                                LineMark(
                                    x: .value("Week Day", $0.weekday, unit: .day),
                                    y: .value("Step Count", $0.steps)
                                )
                            }
                        }
                    }
                    
                    GroupBox ( "Dummy Chart") {
                        Chart(currentWeek) {
                            LineMark(
                                x: .value("Week Day", $0.weekday, unit: .day),
                                y: .value("Step Count", $0.steps)
                            )
                            
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
            }
            
            
            
        } // END ZSTACK
        .navigationTitle("Compoundify")
        
    }
    
    func calculatePressed() {
        // do something
        print("Calculate Pressed!")
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
