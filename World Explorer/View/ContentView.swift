//
//  ContentView.swift
//  World Explorer
//
//  Created by Cem Aksoy on 30.01.2026.
//

import SwiftUI

struct ContentView: View {
  @State private var showOnboarding = true
  // @AppStorage("onboarding") var showOnboarding = true
    var body: some View {
      TabView {
        Tab("Explore", systemImage: "magnifyingglass") {
          NavigationStack {
            CountryListView()
              .navigationTitle("Countries:")
          }
        }
        
        Tab("Saved", systemImage: "bookmark") {
          NavigationStack {
            SavedCountriesListView()
              .navigationTitle("Saved:")
          }
        }
      }
      .tint(.color1)
      .fullScreenCover(isPresented: $showOnboarding) {
        OnboardingView(showOnboarding: $showOnboarding)
      }
      
    }
}

#Preview {
    ContentView()
}
