//
//  OnboardingView.swift
//  World Explorer
//
//  Created by Cem Aksoy on 30.01.2026.
//

import SwiftUI

struct OnboardingView: View {
  
    var body: some View {
      TabView {
        OnboardingPageView(title: "Welcome to \n World Explorer!", imageName: "img1", description: "Explore the world and more!", lastView: false, buttonAction: {})
        
        OnboardingPageView(title: "Countries and Details", imageName: "img2", description: "Search for countries in selected region and learn more about them.", lastView: false, buttonAction: {})
        
        OnboardingPageView(title: "Let's Start", imageName: "img3", description: "Let's explore the world together!", lastView: true, buttonAction: {})
      }
      .ignoresSafeArea()
      .padding(.bottom)
      .tabViewStyle(.page(indexDisplayMode: .always))
      .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    OnboardingView()
}
