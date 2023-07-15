//
//  ContentView.swift
//  Conversores
//
//  Created by Daniel Pelluso Andrade on 14/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var converterViewModel = ConverterViewModel()
    
    var body: some View {
        
        Color(red: 58/255, green: 133/255, blue: 223/255)
        .ignoresSafeArea()
        .overlay {
            
            VStack {
                Spacer(minLength: 10)
   
                HStack {
                    Spacer().frame(width: 40)
                    Spacer()
                    
                    Text(converterViewModel.lbtUnit)
                        .font(.system(size: 34) .weight(.light))
                        .foregroundColor(.white)
                    
                    Spacer()
                    Button {
                        converterViewModel.showNext()
                    } label: {
                        Text("≫")
                            .frame(maxWidth: 40, maxHeight: 40)

                    }
                    .font(.system(size: 20, weight: .ultraLight))
                    .foregroundColor(.white)
                }
                
                Spacer(minLength: 50)
                
                
                ZStack {
                           Color.white.opacity(0.2)
                               .frame(width: 300, height: 120)
                               .cornerRadius(10)
                           
                    TextField("0", text: $converterViewModel.tfValue)
                               .font(.system(size: 100, weight: .regular))
                               .foregroundColor(.white)
                               .frame(width: 300, height: 120)
                               .background(Color.white.opacity(0.2))
                               .cornerRadius(10)
                               .padding(.all, 10)
                               .multilineTextAlignment(.center)
                               .disableAutocorrection(true)
                               .minimumScaleFactor(0.2)
                       }
                       .frame(width: 300, height: 120)
                
                Spacer(minLength: 60)
                
                
                
                HStack {
                                
                    Button {
                        converterViewModel.bt1 = true
                        converterViewModel.convert()
                        
                    } label: {
                        HStack {
                            Text(converterViewModel.btUnit1)
                                .font(.system(size: 25, weight: .light))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .opacity(converterViewModel.btOpacity1)
                        }
                        .frame(maxWidth: 150, maxHeight: 60)
                    }

                    Button {
                        converterViewModel.bt1 = false
                        converterViewModel.convert()
                        
                    } label: {
                        HStack {
                            Text(converterViewModel.btUnit2)
                                .font(.system(size: 25, weight: .light))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .opacity(converterViewModel.btOpacity2)
                        }
                        .frame(maxWidth: 150, maxHeight: 60)
                    }
                }
                
                Spacer(minLength: 20)
                
                
                ZStack{
                    Color(.white).ignoresSafeArea()
                    
                    VStack {
                
                        Text(converterViewModel.lbResult)
                            .font(.system(size: 100, weight: .regular))
                            .foregroundColor(Color(red: 58/255, green: 133/255, blue: 223/255))
                            .frame(width: 300, height: 120)
                            .minimumScaleFactor(0.2)
                            
                        
                        Text(converterViewModel.lbResultUnit)
                            .font(.system(size: 25, weight: .light))
                            .foregroundColor(Color(red: 58/255, green: 133/255, blue: 223/255))
                            .frame(width: 300, height: 60)
                            
                        
                    }
                    
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
