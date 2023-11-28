//
//  BindingSampleApp.swift
//  BindingSample
//
//  Created by 阿部紘明 on 2023/11/27.
//

import ComposableArchitecture
import SwiftUI

@main
struct BindingSampleApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(store: Store(initialState: ContentFeature.State(isOn: false, sub: SubFeature.State(isOn: false)), reducer: {
        ContentFeature()
      }))
    }
  }
}
