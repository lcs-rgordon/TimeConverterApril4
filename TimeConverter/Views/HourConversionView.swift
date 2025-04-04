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
                    Text("\(conversionResult.timeInHours)")

                    Text("\(conversionResult.timeInMinutes)")

                    Text("\(conversionResult.timeInSeconds)")

                } else {
                  
                    ContentUnavailableView("Unable to perform conversion", systemImage: "gear.badge.questionmark", description: Text(viewModel.recoverySuggestion))
                        .frame(height: 200)
                    
                }

                // INPUT
                TextField("Enter the number of hours", text: $viewModel.providedHours)
                    .textFieldStyle(.roundedBorder)
                


            }
            .navigationTitle("Time Converter")

        }

    }
}

#Preview {
    HourConversionView()
}
