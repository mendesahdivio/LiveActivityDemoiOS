//
//  TimerAttributes.swift
//  WidgetDemo
//
//  Created by ahdivio mendes on 07/10/23.
//

import Foundation
import ActivityKit

struct TimerAtributes: ActivityAttributes {
  public typealias TimerStatus = ContentState
  
  public struct ContentState: Codable & Hashable {
    var endTimer: Date
  }
  
  let timerName: String
}
