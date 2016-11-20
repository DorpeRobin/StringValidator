//
//  BooleanTests.swift
//  StringValidator
//
//  Created by Robin Dorpe on 12/11/2016.
//
//

import XCTest
@testable import StringValidator

class BooleanTests: XCTestCase {
    
    func testIsBoolean() {
        let booleans = ["true", "false", "yes", "no", "1", "0"]
        for boolean in booleans {
            let result = Validator.isBoolean(boolean)
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotBoolean() {
        let notBooleans = ["true ", "False", "oui", "non", "1.0", "0.0"]
        for notBoolean in notBooleans {
            let result = Validator.isBoolean(notBoolean)
            XCTAssertEqual(result, false)
        }
    }
    
}
