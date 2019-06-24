//
//  ExpressionProccessor.swift
//  calculator
//
//  Created by pragmus on 22/06/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class ExpressionProccessor: NSObject {
    
    func validateExpression(_ dirtyExpression: String) -> Bool {
        let separators = NSCharacterSet(charactersIn: " +-*/()123456789")
        let expressionVariables = dirtyExpression.components(separatedBy: separators as CharacterSet).filter { (char) in
            return char != ""
        }
        
        if expressionVariables.count >= 2 {
            let filteredDublicateExpressionVariables = expressionVariables.filter { (char) in
                return (char != expressionVariables.first)
            }
            return filteredDublicateExpressionVariables.count == 0
        } else if expressionVariables.count == 1 {
            return true
        } else if expressionVariables.count == 0 {
            return false
        }
        
        return false
    }
    
}
