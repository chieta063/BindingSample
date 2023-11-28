//
//  ContentView.swift
//  BindingSample
//
//  Created by 阿部紘明 on 2023/11/27.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
  let store: StoreOf<ContentFeature>
  var body: some View {
    WithViewStore(store, observe: {$0}) { viewStore in
      VStack(content: {
//        Form(content: {
//          Toggle("Switch", isOn: viewStore.binding(get: { state in
//            state.isOn
//          }, send: { value in
//            ContentFeature.Action.onChangeSwitch(value)
//          }))
//        })
//        SubView(store: Store(initialState: SubFeature.State(isOn: viewStore.isOn), reducer: {
//          SubFeature()
//        }))
        Form(content: {
          Toggle("Switch", isOn: viewStore.binding(get: { state in
            state.isOn
          }, send: { value in
            ContentFeature.Action.onChangeSwitch(value)
          }))
        })
        SubView(store: store.scope(state: \.sub, action: \.sub))
      })
    }
  }
}

#Preview {
  ContentView(store: Store(initialState: ContentFeature.State(isOn: false, sub: SubFeature.State(isOn: false)), reducer: {
    ContentFeature()
  }))
}
