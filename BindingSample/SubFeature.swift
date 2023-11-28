//
//  SubFeature.swift
//  BindingSample
//
//  Created by 阿部紘明 on 2023/11/28.
//

import Foundation
import ComposableArchitecture

struct SubFeature: Reducer {
  struct State: Equatable {
    @BindingState var isOn: Bool
  }
  
  enum Action: Equatable {
    case onSwitchChanged(Bool)
    case onTapCheckStateButton
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .onSwitchChanged(let bool):
      print("SubFeature onSwitchChanged")
      state.isOn = bool
      return .none
    case .onTapCheckStateButton:
      print("State is \(state.isOn)")
      return .none
    }
  }
}
