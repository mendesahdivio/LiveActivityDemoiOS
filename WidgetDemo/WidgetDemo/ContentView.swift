//
//  ContentView.swift
//  WidgetDemo
//
//  Created by ahdivio mendes on 07/10/23.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
  @State var activity: Activity<TimerAtributes>? = nil
  
  var body: some View {
    VStack(spacing: 16) {
      Button("Start timer"){
        StartTimer()
      }
      
      Button("Stop timer"){
        stopTimer()
      }
    }.buttonStyle(.borderedProminent)
      .controlSize(.large)
    
  }
  
  
  private func StartTimer() {
    let attributes = TimerAtributes(timerName: "Dummy Timer")
    let state = TimerAtributes.TimerStatus(endTimer: Date().addingTimeInterval(60*3))
    let contentState = TimerAtributes.ContentState(endTimer: Date().addingTimeInterval(60*3))
    
    do {
      activity = try Activity<TimerAtributes>.request(attributes: attributes, contentState: state, pushType: nil)
    } catch {
      print(error.localizedDescription)
    }
    
    
  }
  
  private func stopTimer() {
    let state = TimerAtributes.TimerStatus(endTimer: .now)
    let contentState:ActivityContent<Activity<TimerAtributes>.ContentState>? = .init(state: state, staleDate: .distantFuture)
    
    Task {
      //await activity?.end(using: state, dismissalPolicy: .immediate)
      await activity?.end(dismissalPolicy: .immediate)
    }
  }
}

#Preview {
  ContentView()
}
