//
//  CountryListView.swift
//  World Explorer
//
//  Created by Cem Aksoy on 27.01.2026.
//

import SwiftUI

struct CountryListView: View {
  @State private var countryVM = CountryViewModel()
  @State private var selectedRegion: Regions = .europa
  
    var body: some View {
      NavigationStack {
        VStack {
          HStack{
            Text("Select region: ")
            Spacer()
            Picker("", selection: $selectedRegion) {
              ForEach(Regions.allCases, id: \.self) { region in
                Text(region.rawValue.capitalized)
              }
            }
            .tint(.black)
            .pickerStyle(.menu)
            .onChange(of: selectedRegion) {
              countryVM.region = selectedRegion.rawValue
              Task {
                await countryVM.getData()
              }
            }
          }
          .padding(.horizontal)
          List(countryVM.countries) { country in
            HStack {
              Text(country.flag)
              Text(country.name.common)
            }
              .font(.title)
          }
          .listStyle(.plain)
        }
        .navigationTitle("Countries:")
        .task {
          await countryVM.getData()
        }
      }
    }
}

#Preview {
    CountryListView()
}
