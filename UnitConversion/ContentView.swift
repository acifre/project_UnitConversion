//
//  ContentView.swift
//  UnitConversion
//
//  Created by Anthony Cifre on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var unitType = "Length"
    @State private var valueToConvert = 0.0
    
    let typesOfUnits = ["Temperature", "Length", "Time", "Volume"]
    
    
    let tempUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    let lengthUnits: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    let timeUnits: [UnitDuration] = [.seconds, .minutes, .hours]
    let volumeUnits: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .gallons]
    
    
    
    // two sections
    // first section: choose from type of units
    // second section: enter in toConvert and unit
    // third section: show conversion
    
    
    var body: some View {
        NavigationView {
            Form {
                Section("Pick Unit Type") {
                    Picker("Pick Units", selection: $unitType) {
                        ForEach(typesOfUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                

            }
            .navigationTitle("UnitConversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
