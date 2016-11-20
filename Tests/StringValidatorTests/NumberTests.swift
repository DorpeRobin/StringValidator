//
//  NumberTests.swift
//  StringValidator
//
//  Created by Robin Dorpe on 12/11/2016.
//
//

import XCTest
@testable import StringValidator

class NumberTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Int Tests
    func testIsInt() {
        let ints = [
            "13",
            "123",
            "0",
            "123",
            "-0",
            "+1",
            "01",
            "-01",
            "000",
            "000123"
        ]
        for int in ints {
            let result = Validator.isNumeric(int)
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotInt() {
        let notInts = [
            "100e10",
            "123.123",
            "   ",
            ""
        ]
        for notInt in notInts {
            let result = Validator.isNumeric(notInt)
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - Numeric Tests
    func testIsNumeric() {
        let numerics = [
            "123",
            "00123",
            "-00123",
            "0",
            "-0",
            "+123"
        ]
        for numeric in numerics {
            let result = Validator.isNumeric(numeric)
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotNumeric() {
        let notNumerics = [
            "123.123",
            "",
            "."
        ]
        for notNumeric in notNumerics {
            let result = Validator.isNumeric(notNumeric)
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - Decimal Tests
    func testIsDecimal() {
        let decimals = [
            "123",
            "00123",
            "-00123",
            "0", "-0",
            "+123",
            "0.01",
            ".1",
            "1.0",
            "-.25",
            "0.0000000000001"
        ]
        for decimal in decimals {
            let result = Validator.isDecimal(decimal)
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotDecimal() {
        let notDecimals = [
            "...",
            "",
            ".",
            "0.1a",
            "a"
        ]
        for notDecimal in notDecimals {
            let result = Validator.isDecimal(notDecimal)
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - Float Tests
    func testIsFloat() {
        let floats = [
            "123",
            "123.",
            "123.123",
            "-123.123",
            "-0.123",
            "+0.123",
            "0.123",
            ".0",
            "01.123",
            "-0.22250738585072011e-307"
        ]
        for float in floats {
            let result = Validator.isFloat(float)
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotFloat() {
        let notFloats = [
            "-.123",
            "  ",
            "",
            ".",
            "foo"
        ]
        for notFloat in notFloats {
            let result = Validator.isFloat(notFloat)
            XCTAssertEqual(result, false)
        }
    }
    
}
