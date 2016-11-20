//
//  WebTests.swift
//  StringValidator
//
//  Created by Robin Dorpe on 12/11/2016.
//
//

import XCTest
@testable import StringValidator

class WebTests: XCTestCase {
    
    // MARK: - FQDN
    func testIsFQDN() {
        let fqdns = [
            "domain.com",
            "dom.plato",
            "a.domain.co",
            "foo--bar.com",
            "xn--froschgrn-x9a.com",
            "rebecca.blackfriday"
        ]
        for fqdn in fqdns {
            let result = Validator.isFQDN(fqdn)
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotFQDN() {
        let notFqdns = [
            "abc",
            "256.0.0.0",
            "_.com",
            "*.some.com",
            "s!ome.com",
            "domain.com/",
            "/more.com"
        ]
        for notFqdn in notFqdns {
            let result = Validator.isFQDN(notFqdn)
            XCTAssertEqual(result, false)
        }
    }
    
}
