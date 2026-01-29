//
//  CountryDetail.swift
//  World Explorer
//
//  Created by Cem Aksoy on 28.01.2026.
//

import Foundation

struct CountryDetail: Codable {
  var subregion: String
  var capital: [String]
  var flags: Flag
  var coatOfArms: CoatOfArm
  
  
  struct Flag: Codable {
    var png: String
  }
  
  struct CoatOfArm: Codable {
    var png: String? = ""
  }
}
