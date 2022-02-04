//
//  Bundle+unitTest.swift
//  PokemonTests
//
//  Created by norelhoda on 4.02.2022.
//

import Foundation

extension Bundle {
    public class var unitTest: Bundle {
        return Bundle(for: ApiServiceTests.self)
    }
}
