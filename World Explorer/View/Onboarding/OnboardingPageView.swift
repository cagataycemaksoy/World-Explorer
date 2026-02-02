//
//  OnboardingPageView.swift
//  World Explorer
//
//  Created by Cem Aksoy on 30.01.2026.
//

import SwiftUI

struct OnboardingPageView: View {
  var title = "Welcome to \n World Explorer!"
  var imageName = "img1"
  var description = "Exlopre the countries and more!"
  
  var lastView = false
  var buttonAction: () -> Void
  
  
    var body: some View {
      ZStack {
        LinearGradient(colors: [.color1.opacity(0.4), .white], startPoint: .topLeading, endPoint: .bottom)
          .ignoresSafeArea()
        
        VStack {
          Text(title)
            .font(.largeTitle)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .padding(.top, 50)
          
          Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 280, height: 350)
            .padding(.top)
          
          Text(description)
            .font(.title3)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
            .frame(width: 280)
            .padding(.bottom)
          
          Button(lastView ? "Explore!" : "Next") {
            buttonAction()
          }
          .tint(.color1)
          .buttonStyle(.bordered)
          .scaleEffect(1.2)
          Spacer()
        }
      }
    }
}

#Preview {
    OnboardingPageView(buttonAction: {})
}
