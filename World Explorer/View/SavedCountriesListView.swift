//
//  SavedCountriesListView.swift
//  World Explorer
//
//  Created by Cem Aksoy on 30.01.2026.
//

import SwiftUI

struct SavedCountriesListView: View {
  let countries = ["Turkey": "🇹🇷", "Germany": "🇩🇪", "France": "🇫🇷", "Italy": "🇮🇹", "Spain": "🇪🇸"]
  
    var body: some View {
      List {
        ForEach(countries.sorted(by: {$0.key < $1.key} ), id: \.key) { (key, value) in
          HStack {
            Text(key)
              .fontWeight(.medium)
            Text(value)
          }
          .font(.title)
        }
      }
      .listStyle(.plain)
    }
}

#Preview {
    SavedCountriesListView()
}
