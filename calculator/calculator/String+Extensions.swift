//
//  File.swift
//  calculator
//
//  Created by pragmus on 22/06/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import Foundation

extension String {
    func cleanSpaces(f: String) -> String {
        return String(format: "%\(f)d", self)
    }
}
