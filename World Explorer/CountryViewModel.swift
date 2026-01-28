//
//  CountryViewModel.swift
//  World Explorer
//
//  Created by Cem Aksoy on 27.01.2026.
//

import Foundation

@MainActor
@Observable
class CountryViewModel {
  var countries: [Country] = []
  var urlString = "https://restcountries.com/v3.1/region/europe"
  var region = "europe"
  
  func getData() async {
    guard let url = URL(string: urlString) else {
      print("Failed to convert the string to URL.")
      return
    }
    
    guard let (data, _) = try? await URLSession.shared.data(from: url) else {
      print("Failed to fetch the data.")
      return
    }
    
    guard let countries = try? JSONDecoder().decode([Country].self, from: data) else {
      print("Failed to decode the response data.")
      return
    }
    
    self.countries = countries
  }
}
