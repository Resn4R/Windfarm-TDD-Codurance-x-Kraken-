//
//  GridChecker.swift
//  Wind Turbine TDD
//
//  Created by Vito Borghi on 16/11/2023.
//

import Foundation

struct GridChecker {
    
   private enum Side {
    case left, right, up, down, topLeading, topTrailing, bottomLeading, bottomTrailing
    }
    
    func isWindFarmValid(size: Int, grid: [[String]]) -> Bool {
        
        guard (size*size) == grid.joined().count
        else { return false }
        
        //check needs fixing: windmills.count == size
        guard grid.flatMap({ row in
            row.filter { plot in
                plot == "+"
            }
        }).count == size else { return false }
        
        switch size {
        case 0: return false
        case 1: return grid == [["+"]] ? true : false
        default:
            for row in 0..<grid.count-1 {
                for column in 0..<grid[0].count-1 {
                    
                    if grid[row][column] == "+" {
                        let turbineLocation = (row: row,column: column)
                        
                        if turbineLocation.row > 0 {
                            let topIsValid = areSurroundingsValid(of: turbineLocation, onSide: .up, inGrid: grid)
                            
                            guard topIsValid else { return false }
                        }
                        
                        if turbineLocation.column > 0 {
                           let leftIsValid = areSurroundingsValid(of: turbineLocation, onSide: .left, inGrid: grid)
                            
                            guard leftIsValid else { return false }
                        }
                        
                        if turbineLocation.column < grid[row].count {
                            let rightIsValid = areSurroundingsValid(of: turbineLocation, onSide: .right, inGrid: grid)
                            
                            guard rightIsValid else { return false }
                        }
                        
                        if turbineLocation.row < grid.count {
                           let bottomIsValid = areSurroundingsValid(of: turbineLocation, onSide: .down, inGrid: grid)
                            
                            guard bottomIsValid else { return false }
                        }
                        
                        if turbineLocation.row > 0 && turbineLocation.column > 0 {
                            let topLeadIsValid = areSurroundingsValid(of: turbineLocation, onSide: .topLeading, inGrid: grid)
                            
                            guard topLeadIsValid else { return false }
                        }
                        
                        if turbineLocation.row > 0  && turbineLocation.column < grid[row].count {
                            let topLeadIsValid = areSurroundingsValid(of: turbineLocation, onSide: .topTrailing, inGrid: grid)
                            
                            guard topLeadIsValid else { return false }
                        }
                        
                        if turbineLocation.row < grid.count && turbineLocation.column > 0 {
                            let topLeadIsValid = areSurroundingsValid(of: turbineLocation, onSide: .bottomLeading, inGrid: grid)
                            
                            guard topLeadIsValid else { return false }
                        }
                        
                        if turbineLocation.row < grid.count && turbineLocation.column < grid[row].count {
                            let topLeadIsValid = areSurroundingsValid(of: turbineLocation, onSide: .bottomTrailing, inGrid: grid)
                            
                            guard topLeadIsValid else { return false }
                        }
                    }
                }
            }
            return true
        }
        
    }
            
            
    private func isPlotEmpty(pos plot: String) -> Bool {
        plot == "," ? true: false
    }
    
    private func areSurroundingsValid(of plot: (row: Int, column: Int), onSide side: Side, inGrid grid: [[String]]) -> Bool {
        
        switch side {
        case .left:
            isPlotEmpty(pos: grid[plot.row][plot.column-1]) ? true : false
        case .right:
            isPlotEmpty(pos: grid[plot.row][plot.column+1]) ? true : false
        case .up:
            isPlotEmpty(pos: grid[plot.row+1][plot.column]) ? true : false
        case .down:
            isPlotEmpty(pos: grid[plot.row+1][plot.column]) ? true : false
        case .topLeading:
            isPlotEmpty(pos: grid[plot.row-1][plot.column-1]) ? true : false
        case .topTrailing:
            isPlotEmpty(pos: grid[plot.row-1][plot.column+1]) ? true : false
        case .bottomLeading:
            isPlotEmpty(pos: grid[plot.row+1][plot.column-1]) ? true : false
        case .bottomTrailing:
            isPlotEmpty(pos: grid[plot.row+1][plot.column+1]) ? true : false
        }
        
    }
    
}
