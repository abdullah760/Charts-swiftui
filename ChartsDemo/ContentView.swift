//
//  ContentView.swift
//  ChartsDemo
//
//  Created by Abdullah on 26/06/2023.
//

import SwiftUI
import Charts

struct Items : Identifiable {
    var id = UUID()
    let type : String
    let value : Double
}
struct ContentView: View {
    let items : [Items] = [
        Items(type: "Medical", value: 10000),
        Items(type: "Engeneering", value: 5000),
        Items(type: "singing", value: 15000),
        Items(type: "pilot", value: 1000),
        Items(type: "athlete", value: 18000),
        
    ]
    
    
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                Chart(items){item in
                    BarMark( x: .value("Job", item.type),
                             y: .value("salary", item.value)
                    )
                    .foregroundStyle(.brown)
                    .cornerRadius(10)
                    
                    
                }
                .chartXAxis{
                    AxisMarks(values: items.map {$0.type}) {type in
                        AxisValueLabel(format: .dateTime.self)
                    }
                    
                }
                .frame(height: 200)
                .padding()
                
                Chart(items){item in
                    LineMark( x: .value("Job", item.type),
                             y: .value("salary", item.value)
                    )
                    .foregroundStyle(.purple)
                    .cornerRadius(0)
                    
                    
                }
                .frame(height: 200)
                .padding()
                Chart(items){item in
                    AreaMark( x: .value("Job", item.type),
                            y: .value("salary", item.value)
                    )
                    .foregroundStyle(.cyan.gradient)
                    .cornerRadius(0)
                    
                    
                }
                .frame(height: 200)
                .padding()
                Chart(items){item in
                    PointMark( x: .value("Job", item.type),
                            y: .value("salary", item.value)
                    )
                    .foregroundStyle(.mint)
                    .cornerRadius(0)
                    
                    
                }
                .frame(height: 200)
                .padding()
                
                
            
            }
            .navigationTitle("Charts")
            
        }
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
