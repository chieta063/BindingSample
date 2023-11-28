//
//  SubView.swift
//  BindingSample
//
//  Created by 阿部紘明 on 2023/11/28.
//

import SwiftUI
import ComposableArchitecture

struct SubView: View {
  var store: StoreOf<SubFeature>
  var body: some View {
    WithViewStore(store, observe: {$0}) { viewStore in
      VStack(content: {
        Form(content: {
          Toggle("Switch", isOn: viewStore.binding(get: { state in
            state.isOn
          }, send: { value in
            SubFeature.Action.onSwitchChanged(value)
          }))
        })
        Button("Check State") {
          viewStore.send(.onTapCheckStateButton)
        }
      })
    }
  }
}

#Preview {
  SubView(store: Store(initialState: SubFeature.State(isOn: false), reducer: {
    SubFeature()
  }))
}
