//
//  ExpressionProccessor.swift
//  calculator
//
//  Created by pragmus on 22/06/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class ExpressionProccessor: NSObject {
    
    var expressionVariable: String?
    
    var functionPoints = Array<CGPoint>()
    var functionXPointRange = 100
    
    func validateExpression(_ dirtyExpression: String) -> Bool {
        func recordExpressionVariable(_ variables: Array<String>) -> Bool {
            expressionVariable = variables.first
            return true
        }
        
        func clearExpressionVariable() -> Bool {
            expressionVariable = nil
            return false
        }
        ///////////////////////////////////////
        
        let separators = NSCharacterSet(charactersIn: " +-*/()123456789")
        let expressionVariables = dirtyExpression.components(separatedBy: separators as CharacterSet).filter { (char) in
            return char != ""
        }
        
        if expressionVariables.count >= 2 {
            let filteredDublicateExpressionVariables = expressionVariables.filter { (char) in
                return (char != expressionVariables.first)
            }
            
            if filteredDublicateExpressionVariables.count == 0 {
                return recordExpressionVariable(expressionVariables)
            } else {
                return clearExpressionVariable()
            }
        } else if expressionVariables.count == 1 {
            return recordExpressionVariable(expressionVariables)
        } else if expressionVariables.count == 0 {
            return clearExpressionVariable()
        }
        
        return clearExpressionVariable()
    }
    
    func generateGraphPointsForFunction(_ expression: String) {
        for i in 0...functionXPointRange {
            let point = CGPoint(x: i, y: replaceVariable(i, expression))
            functionPoints.append(point)
        }
    }
    
    private func replaceVariable(_ value: Int, _ expression: String) -> Int {
        let result = expression.replacingOccurrences(of: expressionVariable!, with: String(value), options: .literal, range: nil)
        return calculateExpression(expression: result)
    }
    
    private func calculateExpression(expression: String) -> Int {
        let expressionToCalc = NSExpression(format: expression)
        let result = expressionToCalc.expressionValue(with: nil, context: nil) as! NSNumber
        return result.intValue
    }
    
}
