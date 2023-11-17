//
//  Wind_Turbine_TDDTests.swift
//  Wind Turbine TDDTests
//
//  Created by Vito Borghi on 16/11/2023.
//

import XCTest
@testable import Wind_Turbine_TDD

final class Wind_Turbine_TDDTests: XCTestCase {
    
    func testGivenA0x0GridShouldReturnFalse() {
        let windFarm: [[String]] = [[]]
        
        let n = 0
        
        XCTAssertFalse(GridChecker().isWindFarmValid(size: n, grid: windFarm))
    }
    
    func testGivenA1x1GridWhenPositioningIsNOTvalidShouldReturnFalse() {
        let windFarm = [[","]]
        
        let n = 1
        
        XCTAssertFalse(GridChecker().isWindFarmValid(size: n, grid: windFarm))
    }
    
    func testGivenA1x1GridWhenPositioningIsValidShouldReturnTrue() {
        let windFarm = [["+"]]
        
        let n = 1
        
        XCTAssertTrue(GridChecker().isWindFarmValid(size: n, grid: windFarm))
    }

    func testGivenA4x4GridWhenPositioningIsNOTvalidShouldReturnFalse() {
        let windFarm = [
            [",","+",",",","],
            [",","+",",","+"],
            ["+",",",",",","],
            [",",",","+",","]
        ]
        
        let n = 4
        
        XCTAssertFalse(GridChecker().isWindFarmValid(size: n, grid: windFarm))
    }
    
    func testGivenA4x4GridWhenPositioningIsValidButSizeIsWrongShouldReturnFalse() {
        let windFarm = [
            [",","+",",",","],
            [",",",",",","+"],
            ["+",",",",",","],
            [",",",","+",","]
        ]
        
        let n = 5
        
        XCTAssertFalse(GridChecker().isWindFarmValid(size: n, grid: windFarm))
    }
    
    func testGivenA4x4GridWhenPositioningIsValidShouldReturnTrue() {
        
        let windFarm = [
            [",","+",",",","],
            [",",",",",","+"],
            ["+",",",",",","],
            [",",",","+",","]
        ]
        
        let n = 4
        
        XCTAssertTrue(GridChecker().isWindFarmValid(size: n, grid: windFarm))
    }

}
