//
//  DataTests.swift
//  StringValidator
//
//  Created by Robin Dorpe on 13/11/2016.
//
//

import XCTest
@testable import StringValidator

class DataTests: XCTestCase {
    
    // MARK: - Min Tests
    func testIsByteLengthMin() {
        let valids = ["abc", "de", "abcd"]
        for valid in valids {
            let result = Validator.isByteLength(str: valid, option: .min(2))
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotByteLengthMin() {
        let invalids = ["a", ""]
        for invalid in invalids {
            let result = Validator.isByteLength(str: invalid, option: .min(2))
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - Max Tests
    func testIsByteLengthMax() {
        let valids = ["abc", "de", "ｇ", "a", ""]
        for valid in valids {
            let result = Validator.isByteLength(str: valid, option: .max(3))
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotByteLengthMax() {
        let invalids = ["abcd", "gｍ"]
        for invalid in invalids {
            let result = Validator.isByteLength(str: invalid, option: .max(3))
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - Min&Max Tests
    func testIsByteLengthMinMax() {
        let valids = ["abc", "de", "ｇ"]
        for valid in valids {
            let result = Validator.isByteLength(str: valid, option: .minMax(min: 2, max: 3))
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotByteLengthMinMax() {
        let invalids = ["", "a", "abcd", "ｇｍ"]
        for invalid in invalids {
            let result = Validator.isByteLength(str: invalid, option: .minMax(min: 2, max: 3))
            XCTAssertEqual(result, false)
        }
    }
    
}
