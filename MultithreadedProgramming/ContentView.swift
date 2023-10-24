//
//  ContentView.swift
//  MultithreadedProgramming
//
//  Created by Student Account on 10/23/23.
//

import SwiftUI
import Dispatch
struct ContentView: View {
    @State private var taskStatus = "Ready to start long task!"
    @State private var isWorking = false
    @State private var sliderValue: Double = 50
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: startLongTask) {
                Text("Start Long Task")
            }
            .disabled(isWorking)
            
            Text(taskStatus)
            
            Slider(value: $sliderValue, in: 0...100, step: 1.0)
            Text("Slider value: \(Int(sliderValue))")
        }
        .padding()
    }
    
    func startLongTask() {
        taskStatus = "Starting the long task..."
        isWorking = true
        
       
        DispatchQueue.global(qos: .background).async {
           
            Thread.sleep(forTimeInterval: 10)
            
          
            DispatchQueue.main.async {
                self.taskStatus = "Long task completed!"
                self.isWorking = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


