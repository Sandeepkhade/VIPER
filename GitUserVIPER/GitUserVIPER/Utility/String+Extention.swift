//
//  String+Extention.swift
//  GitUserVIPER
//
//  Created by Sandeep Khade on 01/11/23.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
