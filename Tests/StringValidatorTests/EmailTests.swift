//
//  EmailTests.swift
//  StringValidator
//
//  Created by Robin Dorpe on 12/11/2016.
//
//

import XCTest
@testable import StringValidator

class EmailTests: XCTestCase {
    
    func testIsEmail() {
        let emails = [
            "foo@bar.com",
            "x@x.au",
            "foo@bar.com.au",
            "foo+bar@bar.com",
            "hans.m端ller@test.com",
            "hans@m端ller.com",
            "test|123@m端ller.com",
            "test+ext@gmail.com",
            "some.name.midd.leNa.me.+extension@GoogleMail.com",
            "gmail...ignores...dots...@gmail.com",
            "\"foobar\"@example.com",
            "\"  foo  m端ller \"@example.com",
            "\"foo\\@bar\"@example.com"
        ]
        
        for email in emails {
            let result = Validator.isEmail(email)
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotEmail() {
        let notEmails = [
            "invalidemail@",
            "invalid.com",
            "@invalid.com",
            "foo@bar.com.",
            "somename@ｇｍａｉｌ.com",
            "foo@bar.co.uk.",
            "z@co.c",
            "ｇｍａｉｌｇｍａｉｌｇｍａｉｌｇｍａｉｌｇｍａｉｌ@gmail.com"
        ]
        
        for notEmail in notEmails {
            let result = Validator.isEmail(notEmail)
            XCTAssertEqual(result, false)
        }
    }
    
    func testIsEmailWithoutUTF8CharsInLocalPart() {
        let emails = [
            "foo@bar.com",
            "x@x.au",
            "foo@bar.com.au",
            "foo+bar@bar.com",
            "hans@m端ller.com",
            "test|123@m端ller.com",
            "test+ext@gmail.com",
            "some.name.midd.leNa.me.+extension@GoogleMail.com",
            "\"foobar\"@example.com",
            "\"foo\\@bar\"@example.com",
            "\"  foo  bar  \"@example.com"
        ]
        
        for email in emails {
            let result = Validator.isEmail(email, options: [])
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotEmailWithoutUTF8CharsInLocalPart() {
        let notEmails = [
            "invalidemail@",
            "invalid.com",
            "@invalid.com",
            "foo@bar.com.",
            "foo@bar.co.uk.",
            "somename@ｇｍａｉｌ.com",
            "hans.m端ller@test.com",
            "z@co.c"
        ]
        
        for notEmail in notEmails {
            let result = Validator.isEmail(notEmail, options: [])
            XCTAssertEqual(result, false)
        }
    }
    
    func testIsEmailWithDisplayName() {
        let emails = [
            "foo@bar.com",
            "x@x.au",
            "foo@bar.com.au",
            "foo+bar@bar.com",
            "hans.m端ller@test.com",
            "hans@m端ller.com",
            "test|123@m端ller.com",
            "test+ext@gmail.com",
            "some.name.midd.leNa.me.+extension@GoogleMail.com",
            "Some Name <foo@bar.com>",
            "Some Name <x@x.au>",
            "Some Name <foo@bar.com.au>",
            "Some Name <foo+bar@bar.com>",
            "Some Name <hans.m端ller@test.com>",
            "Some Name <hans@m端ller.com>",
            "Some Name <test|123@m端ller.com>",
            "Some Name <test+ext@gmail.com>",
            "Some Name <some.name.midd.leNa.me.+extension@GoogleMail.com>",
            "Some Middle Name <some.name.midd.leNa.me.+extension@GoogleMail.com>",
            "Name <some.name.midd.leNa.me.+extension@GoogleMail.com>",
            "Name<some.name.midd.leNa.me.+extension@GoogleMail.com>"
        ]
        
        for email in emails {
            let result = Validator.isEmail(email, options: [.allowDisplayName, .allowUtf8LocalPart])
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotEmailWithDisplayName() {
        let notEmails = [
            "invalidemail@",
            "invalid.com",
            "@invalid.com",
            "foo@bar.com.",
            "foo@bar.co.uk.",
            "Some Name <invalidemail@>",
            "Some Name <invalid.com>",
            "Some Name <@invalid.com>",
            "Some Name <foo@bar.com.>",
            "Some Name <foo@bar.co.uk.>",
            "Some Name foo@bar.co.uk.>",
            "Some Name <foo@bar.co.uk.",
            "Some Name < foo@bar.co.uk >",
            "Name foo@bar.co.uk"
        ]
        
        for notEmail in notEmails {
            let result = Validator.isEmail(notEmail, options: [.allowDisplayName, .allowUtf8LocalPart])
            XCTAssertEqual(result, false)
        }
    }
    
}
