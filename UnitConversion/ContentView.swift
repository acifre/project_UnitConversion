//
//  ContentView.swift
//  UnitConversion
//
//  Created by Anthony Cifre on 1/23/23.
//

import SwiftUI
//import Foundation

struct ContentView: View {
    
    @FocusState var valueIsFocused: Bool
    
    @State private var unitType = "Length"
    @State private var valueToConvert = 0.0
    @State private var selectedUnit = "Length"
    @State private var fromUnitIndex = 0
    @State private var toUnitIndex = 1

    
    let typesOfUnitStrings = ["Temp", "Length", "Time", "Volume"]
    
    
    let tempUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    let lengthUnits: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    let timeUnits: [UnitDuration] = [.seconds, .minutes, .hours]
    let volumeUnits: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .gallons]
    
    var selectedUnitArray: [Dimension] {
        
        switch selectedUnit {
        case "Temp":
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
    
    
    var convertedValue: Double {
        let fromUnit = selectedUnitArray[fromUnitIndex]
        let toUnit = selectedUnitArray[toUnitIndex]
        let value = Measurement(value: valueToConvert, unit: fromUnit)
        let converted = value.converted(to: toUnit)

        
        return converted.value
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                        Section("Pick Unit Type") {
                            Picker("Units", selection: $selectedUnit) {
                                ForEach(typesOfUnitStrings, id: \.self) { unit in
                                    Text(unit)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        Section("Enter Value To Convert") {
                            TextField("Enter Value:", value: $valueToConvert, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($valueIsFocused)
                        }
                        
                        Section("Convert From (Unit)") {
                            Picker("From: ", selection: $fromUnitIndex) {
                                ForEach(0..<selectedUnitArray.count, id: \.self) { index in
                                    Text(selectedUnitArray[index].symbol).tag(selectedUnitArray[index])
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        Section("Convert To (Unit)") {
                            Picker("To: ", selection: $toUnitIndex) {
                                ForEach(0..<selectedUnitArray.count, id: \.self) { index in
                                    Text(selectedUnitArray[index].symbol).tag(selectedUnitArray[index])
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                }

                Spacer()
                HStack {
                    Spacer()
                    Text("\(valueToConvert.removeZerosFromEnd()) \(selectedUnitArray[fromUnitIndex].symbol)")
                    Spacer()
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(convertedValue.removeZerosFromEnd()) \(selectedUnitArray[toUnitIndex].symbol)")
                    Spacer()
                }
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .background(.blue)
                .cornerRadius(20)
                .padding()
                Spacer()
                Spacer()
                
            }
            .navigationTitle("UnitConversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        valueIsFocused = false
                    }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}
