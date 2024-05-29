//
//  ContentView.swift
//  HorizontalSizeClassSwiftUIExample
//
//  Created by Alla Dubovska on 28/05/2024.
//

import SwiftUI

struct ContentView: View {
  enum Constants {
    static let threeColumnLayout = [GridItem(.flexible(), spacing: 16),
                                  GridItem(.flexible(), spacing: 16),
                                  GridItem(.flexible(), spacing: 0)]
    static let oneColumnLayout = [GridItem(.flexible(), spacing: 0)]
  }
  
  @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
  
  @State var gridLayout = Constants.oneColumnLayout
  
  let items = Array(0...50).map { "\($0)"}

  var body: some View {
    ScrollView {
      LazyVGrid(columns: gridLayout) {
        ForEach(items, id: \.self) { item in
          ItemView(textToDisplay: item)
        }
      }
    }
    .onChange(of: horizontalSizeClass) { _, newValue in
      setGridLayout(for: newValue)
    }
    .onAppear {
      setGridLayout(for: horizontalSizeClass)
    }
  }
  
  private func setGridLayout(for sizeClass: UserInterfaceSizeClass?) {
    gridLayout = sizeClass == .regular ? Constants.threeColumnLayout : Constants.oneColumnLayout
  }

}

#Preview {
    ContentView()
}




  
