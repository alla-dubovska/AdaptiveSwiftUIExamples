//
//  ItemView.swift
//  HorizontalSizeClassSwiftUIExample
//
//  Created by Alla Dubovska on 28/05/2024.
//

import SwiftUI

struct ItemView: View {
  @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
  
  @State var isFirstButtonVisible = true
  
  let textToDisplay: String
  
  var body: some View {
    VStack {
      Text("Cell title № \(textToDisplay)")
      
      HStack {
        Text("Cell subtitle № \(textToDisplay)")
        if isFirstButtonVisible {
          Button("Button 1") {
            
          }
          .padding(8)
          .background(.white)
        }
        Button("Button 2") {
          
        }
        .padding(8)
        .background(.white)
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(.mint)
    .onChange(of: horizontalSizeClass) { _, newValue in
      updateButtonVisibility(horizontalSizeClass: newValue)
    }
    .onAppear {
      updateButtonVisibility(horizontalSizeClass: horizontalSizeClass)
    }
  }
  
  private func updateButtonVisibility(horizontalSizeClass: UserInterfaceSizeClass?) {
    isFirstButtonVisible = horizontalSizeClass == .compact
  }
}

#Preview {
  VStack {
    ItemView(textToDisplay: "0")
    ItemView(textToDisplay: "1")
    ItemView(textToDisplay: "2")
  }
}
