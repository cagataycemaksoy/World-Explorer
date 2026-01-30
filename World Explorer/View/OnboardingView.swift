//
//  OnboardingView.swift
//  World Explorer
//
//  Created by Cem Aksoy on 30.01.2026.
//

import SwiftUI

struct OnboardingView: View {
  
  @State private var selectedView = 0
  @Binding var showOnboarding: Bool
  
    var body: some View {
      TabView(selection: $selectedView) {
        OnboardingPageView(title: "Welcome to \n World Explorer!", imageName: "img1", description: "Explore the world and more!", lastView: false, buttonAction: buttonAction)
          .tag(0)
        
        OnboardingPageView(title: "Countries and Details", imageName: "img2", description: "Search for countries in selected region and learn more about them.", lastView: false, buttonAction: buttonAction)
          .tag(1)
        
        OnboardingPageView(title: "Let's Start", imageName: "img3", description: "Let's explore the world together!", lastView: true, buttonAction: buttonAction)
          .tag(2)
      }
      .ignoresSafeArea()
      .padding(.bottom)
      .tabViewStyle(.page(indexDisplayMode: .always))
      .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
  
  func buttonAction() {
    withAnimation {
      if selectedView != 2 {
        selectedView += 1
      } else {
        showOnboarding = false
      }
    }
  }
}

#Preview {
  OnboardingView(showOnboarding: Binding.constant(true))
}
