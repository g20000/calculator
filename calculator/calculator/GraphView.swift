//
//  GraphView.swift
//  calculator
//
//  Created by pragmus on 24/06/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class GraphView: UIView {
    
    var points = Array<CGPoint>()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        draw()
    }
    
    func draw() {
        if let context = UIGraphicsGetCurrentContext() {
            context.setStrokeColor(UIColor.blue.cgColor)
            context.setLineWidth(3)
            context.setLineWidth(5.0)
            
            if points.first != nil {
                context.move(to: points.first!)
                for i in 1...points.count - 1 {
                    context.addLine(to: points[i])
                }
            }
            
            context.drawPath(using: .stroke)
        }
    }

}
