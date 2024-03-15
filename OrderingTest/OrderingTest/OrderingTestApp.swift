//
//  OrderingTestApp.swift
//  OrderingTest
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import SwiftUI

@main
struct OrderingTestApp: App {
    var body: some Scene {
        WindowGroup {
            BusinessFactory.makeBusiness()
        }
    }
}
