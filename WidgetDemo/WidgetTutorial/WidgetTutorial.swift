//
//  WidgetTutorial.swift
//  WidgetTutorial
//
//  Created by ahdivio mendes on 07/10/23.
//

import WidgetKit
import SwiftUI
import ActivityKit



struct TimerActivityView : View {
  let context: ActivityViewContext<TimerAtributes>
//    var entry: Provider.Entry

    var body: some View {
        VStack {
          Text(context.attributes.timerName).font(.headline).foregroundColor(Color.white)
          Text(context.state.endTimer, style: .timer).foregroundColor(Color.white)
        }.background(Color.black)
    }
}

struct WidgetTutorial: Widget {
    let kind: String = "WidgetTutorial"

  var body: some WidgetConfiguration {
    ActivityConfiguration(for: TimerAtributes.self) { context in
      TimerActivityView(context: context)
    } dynamicIsland: { context in
      DynamicIsland {
        DynamicIslandExpandedRegion(.leading) {
          TimerActivityView(context: context)
        }
      } compactLeading: {
        Image(systemName: "circle")
          .foregroundColor(.green)
      } compactTrailing: {
        Text("timerCompact")
      } minimal: {
        Image(systemName: "circle")
          .foregroundColor(.green)
      }
    }
  }
}



//#Preview(as: .systemSmall) {
//    WidgetTutorial()
//} timeline: {
//    SimpleEntry(date: .now, emoji: "😀")
//    SimpleEntry(date: .now, emoji: "🤩")
//}
