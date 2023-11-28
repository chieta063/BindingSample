//
//  ContentFeature.swift
//  BindingSample
//
//  Created by 阿部紘明 on 2023/11/27.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ContentFeature {
  struct State: Equatable {
    @BindingState var isOn: Bool
    var sub: SubFeature.State
  }
  
  enum Action: Equatable {
    case onChangeSwitch(Bool)
    case sub(SubFeature.Action)
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .onChangeSwitch(let bool):
      state.isOn = bool
      state.sub.isOn = bool
      print("On Value Changed")
      return .none
    case let .sub(action):
      switch action {
      case .onSwitchChanged(let bool):
        print("ContentView On Changed")
        state.isOn = bool
        state.sub.isOn = bool
        return .none
      default:
        return .none
      }
    }
  }
}
