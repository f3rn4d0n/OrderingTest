//
//  Int+Extension.swift
//
//
//  Created by Luis Fernando Bustos Ramírez on 18/03/24.
//

import Foundation

public extension Int {
    func asTime() -> String {
        if self > 9 {
            return "\(self)"
        } else {
            return "0\(self)"
        }
    }
}
