//
//  AdaptiveContentView.swift
//  HorizontalSizeClassSwiftUIExample
//
//  Created by Alla Dubovska on 29/05/2024.
//

import SwiftUI

struct AdaptiveContentView: View {
  let items = Array(0...50).map { "\($0)"}

  var body: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
        ForEach(items, id: \.self) { item in
          Text("\(item)")
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(.purple)
        }
      }
    }
  }
}

#Preview {
  AdaptiveContentView()
}




