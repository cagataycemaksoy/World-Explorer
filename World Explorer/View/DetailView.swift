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
        .padding(.bottom)
        
        Text("Flag: ")
          .bold()
        
        AsyncImage(url: URL(string: countryDetailVM.countryDetail.flags.png)) { phase in
          if let image = phase.image {
            image
              .resizable()
              .scaledToFit()
              .shadow(radius: 8)
          } else if phase.error != nil {
            Image(systemName: "questionmark.square.dashed")
              .resizable()
              .scaledToFit()
              .shadow(radius: 8)
          } else {
            ProgressView()
              .tint(.color1)
              .scaleEffect(4)
            
          }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        
        if let coatOfArmImage = countryDetailVM.countryDetail.coatOfArms.png {
          Text("Coat Of Arm: ")
            .bold()
            .padding(.top)
          
          AsyncImage(url: URL(string: coatOfArmImage)) { phase in
            if let image = phase.image {
              image
                .resizable()
                .scaledToFit()
                .shadow(radius: 8)
            } else if phase.error != nil {
              Image(systemName: "questionmark.square.dashed")
                .resizable()
                .scaledToFit()
                .shadow(radius: 8)
            } else {
              ProgressView()
                .tint(.color1)
                .scaleEffect(4)
            }
          }
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        
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
