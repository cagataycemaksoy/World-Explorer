//
//  CountryDetailViewModel.swift
//  World Explorer
//
//  Created by Cem Aksoy on 28.01.2026.
//

import Foundation

@MainActor
@Observable

class CountryDetailViewModel {
  var countryDetail = CountryDetail(subregion: "", capital: [], flags: CountryDetail.Flag(png: ""), coatOfArms: CountryDetail.CoatOfArm(png: ""))
  var countryName = "germany"
  var baseURL = "https://restcountries.com/v3.1/name/"
  
  func getData() async {
    guard let url = URL(string: baseURL + countryName.lowercased()) else {
      print("Failed to create a valid URL.")
      return
    }
    
    guard let (data, _) = try? await URLSession.shared.data(from: url) else {
      print("Failed to get data from the url.")
      return 
    }
    
    guard let countryDetail = try? JSONDecoder().decode([CountryDetail].self, from: data)[0] else {
      print("Failed to decode the data.")
      return
    }
    
    self.countryDetail = countryDetail
  }
}
