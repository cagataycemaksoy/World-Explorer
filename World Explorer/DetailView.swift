//
//  DetailView.swift
//  World Explorer
//
//  Created by Cem Aksoy on 28.01.2026.
//

import SwiftUI

struct DetailView: View {
  @State var country: Country
  @State private var countryDetailVM = CountryDetailViewModel()
  
    var body: some View {
      VStack(alignment: .leading) {
        Text(country.name.common)
          .font(.largeTitle)
          .bold()
        
        Rectangle()
          .fill(.gray)
          .frame(height: 1.5)
        
        HStack {
          Text("Region: ")
            .bold()
          Text(countryDetailVM.countryDetail.subregion)
        }
        .padding(.bottom, 5)
        
        HStack(alignment: .top) {
          Text("Capital: ")
            .bold()
          Text(capitalsString(countryDetailVM.countryDetail.capital))
        }
        Spacer()
      }
      .font(.title3)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .padding(.horizontal)
      .task {
        countryDetailVM.countryName = country.name.common
        await countryDetailVM.getData()
      }
    }
  
  private func capitalsString(_ capitals: [String]) -> String {
    capitals.joined(separator: ", ")
  }
}

#Preview {
    DetailView(country: Country(name: Name(common: "South Africa"), flag: "🇹🇷"))
}
