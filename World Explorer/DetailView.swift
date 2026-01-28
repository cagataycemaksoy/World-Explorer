//
//  DetailView.swift
//  World Explorer
//
//  Created by Cem Aksoy on 28.01.2026.
//

import SwiftUI

struct DetailView: View {
  @State var country: Country
  
    var body: some View {
      VStack(alignment: .leading) {
        Text(country.name.common)
          .font(.largeTitle)
          .bold()
        
        Rectangle()
          .fill(.gray)
          .frame(height: 1.5)
        Spacer()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .padding(.horizontal)
    }
}

#Preview {
    DetailView(country: Country(name: Name(common: "Turkey"), flag: "🇹🇷"))
}
