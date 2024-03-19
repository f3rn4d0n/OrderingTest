//
//  File.swift
//  
//
//  Created by Luis Fernando Bustos Ramírez on 18/03/24.
//

import Foundation

extension URLCache {
    
    static let imageCache = URLCache(memoryCapacity: 512_000_000, diskCapacity: 10_000_000_000)
}
