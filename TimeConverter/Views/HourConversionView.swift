//
//  HourConversionView.swift
//  TimeConverter
//
//  Created by Russell Gordon on 2025-02-24.
//

import SwiftUI

struct HourConversionView: View {
    
    // MARK: Stored properties
    @State var viewModel = HourConversionViewModel()
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                // OUTPUT
                
                // We will unwrap the optional conversionResult if possible and show result
                if let conversionResult = viewModel.conversionResult {
                    
                    VStack(alignment: .leading) {
                        Text("\(conversionResult.timeInHours.formatted()) hours")
                        
                        HStack {

                            Text("= \(conversionResult.timeInMinutes.formatted()) minutes,")

                            Text("\(conversionResult.timeInSeconds.formatted()) seconds")

                        }

                    }
                    .font(.title3)
                    .frame(height: 200)

                    Button {
                        viewModel.saveResult()
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(.borderedProminent)
                    

                } else {
                  
                    ContentUnavailableView("Unable to perform conversion", systemImage: "gear.badge.questionmark", description: Text(viewModel.recoverySuggestion))
                        .frame(height: 200)

                }

                // INPUT
                TextField("Enter the number of hours", text: $viewModel.providedHours)
                    .textFieldStyle(.roundedBorder)
                

                HStack {
                    Text("History")
                        .bold()
                        .font(.title3)
                        
                    Spacer()
                }
                
                

            }
            .padding()
            .navigationTitle("Time Converter")

        }

    }
}

#Preview {
    HourConversionView()
}
