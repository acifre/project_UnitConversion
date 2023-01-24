//
//  ContentView.swift
//  UnitConversion
//
//  Created by Anthony Cifre on 1/23/23.
//

import SwiftUI
//import Foundation

struct ContentView: View {
    
    @State private var unitType = "Length"
    @State private var valueToConvert = 0.0
    @State private var selectedUnit = "Length"
    //@State private var fromUnit = computedType

    
    let typesOfUnitStrings = ["Temperature", "Length", "Time", "Volume"]
    
    
    let tempUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    let lengthUnits: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    let timeUnits: [UnitDuration] = [.seconds, .minutes, .hours]
    let volumeUnits: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .gallons]
    
    var selectedUnitArray: Array<Any> {
        
        switch selectedUnit {
        case "Temperature":
            return tempUnits
        case "Length":
            return lengthUnits
        case "Time":
            return timeUnits
        case "Volume":
            return volumeUnits
        default:
            return lengthUnits
        }
    }
    
    
    // two sections
    // first section: choose from type of units
    // second section: enter in toConvert and unit
    // third section: show conversion
    
    
    var body: some View {
        NavigationView {
            Form {
                List {
                    Section("Pick Unit Type") {
                        Picker("Units", selection: $selectedUnit) {
                            ForEach(typesOfUnitStrings, id: \.self) { unit in
                                Text(unit)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    
                    Section("Pick Conversions") {
                        TextField("Enter Value:", value: $valueToConvert, format: .number)
                       // Picker("Pick Unit", selection: <#T##Binding<SelectionValue>#>)
                    }
                }
            }
            .navigationTitle("UnitConversion")
        }
    }
    
    func getUnitType() -> Unit {
        return UnitVolume.gallons
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
