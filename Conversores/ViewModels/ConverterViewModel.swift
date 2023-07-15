//
//  ConverterViewModel.swift
//  Conversores
//
//  Created by Daniel Pelluso Andrade on 17/07/23.
//

import Foundation

class ConverterViewModel: ObservableObject {
    
    @Published var lbtUnit = "Temperatura"
    @Published var btUnit1 = "Celsius"
    @Published var btUnit2 = "Fahrenheit"
    @Published var tfValue = ""
    @Published var lbResultUnit = ""
    @Published var lbResult = ""
    @Published var btOpacity1 = 1.0
    @Published var btOpacity2 = 0.5
    @Published var bt1 = true
    
    func showNext() {
        
        lbResultUnit = ""
        lbResult = ""
        
        switch lbtUnit {
            case "Temperatura":
                lbtUnit = "Peso"
                btUnit1 = "Quilograma"
                btUnit2 = "Libra"
                
            case "Peso":
                lbtUnit = "Moeda"
                btUnit1 = "Real"
                btUnit2 = "Dólar"
                
            case "Moeda":
                lbtUnit = "Distância"
                btUnit1 = "Metro"
                btUnit2 = "Quilômetro"
                
            default:
                lbtUnit = "Temperatura"
                btUnit1 = "Celsius"
                btUnit2 = "Fahrenheit"
        }
        

        convert()
        
    }
    
    
    func convert() {
        
        lbResultUnit = ""
        lbResult = ""
        
        if bt1 == true {
            btOpacity1 = 1.0
            btOpacity2 = 0.5
        } else {
            btOpacity1 = 0.5
            btOpacity2 = 1.0
        }
        
        switch lbtUnit {
            case "Temperatura":
                calcTemperature()
                
            case "Peso":
               calcWeight()
                
            case "Moeda":
                calcCurrency()
            
            default:
                calcDistance()
        }
        
        
    }
    
    
    func calcTemperature() {
        
        guard let temperature = Double(tfValue) else {return}
        
        
        if bt1 == true {
            lbResultUnit = "Fahrenheit"
            lbResult = String(temperature * 1.8 + 32.0)
        }
        else {
            lbResultUnit = "Celsius"
            lbResult = String((temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight() {
        
        guard let weight = Double(tfValue) else {return}
        
        if bt1 == true {
            lbResultUnit = "Libra"
            lbResult = String(weight / 2.2046)
        }
        else {
            lbResultUnit = "Quilograma"
            lbResult = String(weight * 2.2046)
        }
        
    }
    
    func calcCurrency() {
        guard let currency = Double(tfValue) else {return}
        
        if bt1 == true {
            lbResultUnit = "Dólar"
            lbResult = String(currency / 4.81)
        }
        else {
            lbResultUnit = "Real"
            lbResult = String(currency * 4.81)
        }
        
    }
    
    func calcDistance() {
        
        guard let distance = Double(tfValue) else {return}
        
        if bt1 == true {
            lbResultUnit = "Quilômetro"
            lbResult = String(distance / 1000)
        }
        else {
            lbResultUnit = "Metros"
            lbResult = String(distance * 1000)
        }
        
    }
    
    
}
