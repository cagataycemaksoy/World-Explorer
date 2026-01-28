//
//  Country.swift
//  World Explorer
//
//  Created by Cem Aksoy on 27.01.2026.
//

import Foundation

struct Country: Codable, Identifiable {
  let id = UUID().uuidString
  var name: Name
  var flag: String
  
  
  enum CodingKeys: CodingKey {
    case name
    case flag
  }
}

struct Name: Codable {
  var common: String
}
