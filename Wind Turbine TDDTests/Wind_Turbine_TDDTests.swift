//
//  Wind_Turbine_TDDTests.swift
//  Wind Turbine TDDTests
//
//  Created by Vito Borghi on 16/11/2023.
//

import XCTest
@testable import Wind_Turbine_TDD

final class Wind_Turbine_TDDTests: XCTestCase {
    
    func testGivenA1x1GridWhenPositioningIsValidShouldReturnTrue() {
        let windFarm: [[String]] = [["+"]]
        
        let n = 1
        
        XCTAssertTrue(GridChecker().isWindFarmValid(size: n, grid: windFarm))
    }

    func testGivenA4x4GridWhenPositioningIsValidShouldReturnTrue() {
        
        let windFarm: [[String]] = [
            [",","+",",",","],
            [",",",",",","+"],
            ["+",",",",",","],
            [",",",","+",","]
        ]
        
        let n = 4
        
        XCTAssertTrue(GridChecker().isWindFarmValid(size: n, grid: windFarm))
    }

}
