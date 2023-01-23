//
//  ContentView.swift
//  UnitConversion
//
//  Created by Anthony Cifre on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    
    
    let typesOfUnits = ["Temperature", "Length", "Time", "Volume"]
    let tempUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    let lengthUnits: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    let timeUnits: [UnitDuration] = [.seconds, .minutes, .hours]
    let volumeUnits: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .gallons]
    
    
    
    // two sections
    // first section: choose from type of units
    // second section: enter 
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
