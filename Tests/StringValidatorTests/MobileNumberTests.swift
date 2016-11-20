//
//  MobileNumberTests.swift
//  StringValidator
//
//  Created by Robin Dorpe on 12/11/2016.
//
//

import XCTest
@testable import StringValidator

class MobileNumberTests: XCTestCase {
    
    // MARK: - ar-SY locale
    func testIsARSYMobileNumber() {
        let mobileNumbers = [
            "0944549710",
            "+963944549710",
            "956654379",
            "0944549710",
            "0962655597"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "ar-SY")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotARSYMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "",
            "+9639626626262",
            "+963332210972",
            "0114152198"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "ar-SY")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - ar-SA locale
    func testIsARSAMobileNumber() {
        let mobileNumbers = [
            "0556578654",
            "+966556578654",
            "966556578654",
            "596578654",
            "572655597"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "ar-SA")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotARSAMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "",
            "+9665626626262",
            "+96633221097",
            "0114152198"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "ar-SA")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - cs-CZ locale
    func testIsCSCZMobileNumber() {
        let mobileNumbers = [
            "+420 123 456 789",
            "+420 123456789",
            "+420123456789",
            "123 456 789",
            "123456789"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "cs-CZ")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotCSCZMobileNumber() {
        let notMobileNumbers = [
            "",
            "+42012345678"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "cs-CZ")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - de-DE locale
    func testIsDEDEMobileNumber() {
        let mobileNumbers = [
            "+49 (0) 123 456 789",
            "+49 (0) 123 456789",
            "0123/4567890",
            "+49 01234567890",
            "01234567890"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "de-DE")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotDEDEMobileNumber() {
        let notMobileNumbers = [
            "",
            "Vml2YW11cyBmZXJtZtesting123"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "de-DE")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - pt-BR locale
    func testIsPTBRMobileNumber() {
        let mobileNumbers = [
            "55-17-3332-2155",
            "55-15-25661234",
            "551223456789",
            "01523456987",
            "022995678947",
            "+55-12-996551215"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "pt-BR")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotPTBRMobileNumber() {
        let notMobileNumbers = [
            "+017-123456789",
            "5501599623874",
            "+55012962308",
            "+55-015-1234-3214"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "pt-BR")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - zh-CN locale
    func testIsZHCNMobileNumber() {
        let mobileNumbers = [
            "15323456787",
            "13523333233",
            "13898728332",
            "+086-13238234822",
            "08613487234567",
            "8617823492338",
            "86-17823492338"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "zh-CN")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotZHCNMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "",
            "Vml2YW11cyBmZXJtZtesting123",
            "010-38238383"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "zh-CN")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - zh-TW locale
    func testIsZHTWMobileNumber() {
        let mobileNumbers = [
            "0987123456",
            "+886987123456",
            "886987123456",
            "+886-987123456",
            "886-987123456"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "zh-TW")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotZHTWMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "",
            "Vml2YW11cyBmZXJtZtesting123",
            "0-987123456"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "zh-TW")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - en-ZA locale
    func testIsENZAMobileNumber() {
        let mobileNumbers = [
            "0821231234",
            "+27821231234",
            "27821231234"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "en-ZA")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotENZAMobileNumber() {
        let notMobileNumbers = [
            "082123",
            "08212312345",
            "21821231234",
            "+21821231234",
            "+0821231234"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "en-ZA")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - en-AU locale
    func testIsENAUMobileNumber() {
        let mobileNumbers = [
            "61404111222",
            "+61411222333",
            "0417123456"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "en-AU")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotENAUMobileNumber() {
        let notMobileNumbers = [
            "082123",
            "08212312345",
            "21821231234",
            "+21821231234",
            "+0821231234",
            "04123456789"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "en-AU")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - en-HK locale
    func testIsENHKMobileNumber() {
        let mobileNumbers = [
            "91234567",
            "9123-4567",
            "61234567",
            "51234567",
            "+85291234567",
            "+852-91234567",
            "+852-9123-4567",
            "852-91234567"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "en-HK")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotENHKMobileNumber() {
        let notMobileNumbers = [
            "999",
            "+852-912345678",
            "123456789",
            "+852-1234-56789"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "en-HK")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - fr-FR locale
    func testIsFRFRMobileNumber() {
        let mobileNumbers = [
            "0612457898",
            "+33612457898",
            "33612457898",
            "0712457898",
            "+33712457898",
            "33712457898"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "fr-FR")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotFRFRMobileNumber() {
        let notMobileNumbers = [
            "061245789",
            "06124578980",
            "0112457898",
            "0212457898",
            "0312457898",
            "0412457898",
            "0512457898",
            "0812457898",
            "0912457898",
            "+34612457898",
            "+336124578980",
            "+3361245789"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "fr-FR")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - el-GR locale
    func testIsELGRMobileNumber() {
        let mobileNumbers = [
            "+306944848966",
            "6944848966",
            "306944848966"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "el-GR")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotELGRMobileNumber() {
        let notMobileNumbers = [
            "2102323234",
            "+302646041461",
            "120000000",
            "20000000000",
            "68129485729",
            "6589394827",
            "298RI89572"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "el-GR")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - en-GB locale
    func testIsENGBMobileNumber() {
        let mobileNumbers = [
            "447789345856",
            "+447861235675",
            "07888814488"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "en-GB")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotENGBMobileNumber() {
        let notMobileNumbers = [
            "67699567",
            "0773894868",
            "077389f8688",
            "+07888814488",
            "0152456999",
            "442073456754",
            "+443003434751",
            "05073456754",
            "08001123123"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "en-GB")
            XCTAssertEqual(result, false)
        }
        
    }
    
    // MARK: - en-US locale
    func testIsENUSMobileNumber() {
        let mobileNumbers = [
            "19876543210",
            "8005552222",
            "+15673628910"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "en-US")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotENUSMobileNumber() {
        let notMobileNumbers = [
            "564785",
            "0123456789",
            "1437439210",
            "8009112340",
            "+10345672645",
            "11435213543",
            "2436119753",
            "16532116190"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "en-US")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - en-CA locale
    func testIsENCAMobileNumber() {
        let mobileNumbers = [
            "19876543210",
            "8005552222",
            "+15673628910"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "en-CA")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotENCAMobileNumber() {
        let notMobileNumbers = [
            "564785",
            "0123456789",
            "1437439210",
            "8009112340",
            "+10345672645",
            "11435213543",
            "2436119753",
            "16532116190"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "en-CA")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - en-ZM locale
    func testIsENZMMobileNumber() {
        let mobileNumbers = [
            "0956684590",
            "0966684590",
            "0976684590",
            "+260956684590",
            "+260966684590",
            "+260976684590",
            "260976684590"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "en-ZM")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotENZMMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "",
            "Vml2YW11cyBmZXJtZtesting123",
            "010-38238383",
            "966684590"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "en-ZM")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - ru-RU locale
    func testIsRURUMobileNumber() {
        let mobileNumbers = [
            "+79676338855",
            "79676338855",
            "89676338855",
            "9676338855"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "ru-RU")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotRURUMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "",
            "Vml2YW11cyBmZXJtZtesting123",
            "010-38238383",
            "+9676338855",
            "19676338855",
            "6676338855",
            "+99676338855"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "ru-RU")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - sr-RS locale
    func testIsSRRSMobileNumber() {
        let mobileNumbers = [
            "0640133338",
            "063333133",
            "0668888878",
            "+381645678912",
            "+381611314000",
            "0655885010"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "sr-RS")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotSRRSMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "",
            "Vml2YW11cyBmZXJtZtesting123",
            "010-38238383",
            "+9676338855",
            "19676338855",
            "6676338855",
            "+99676338855"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "sr-RS")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - en-NZ locale
    func testIsENNZMobileNumber() {
        let mobileNumbers = [
            "+6427987035",
            "642240512347",
            "0293981646",
            "029968425"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "en-NZ")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotENNZMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "",
            "Vml2YW11cyBmZXJtZtesting123",
            "+642956696123566",
            "+02119620856",
            "+9676338855",
            "19676338855",
            "6676338855",
            "+99676338855"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "en-NZ")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - nb-NO locale
    func testIsNBNOMobileNumber() {
        let mobileNumbers = [
            "+4796338855",
            "+4746338855",
            "4796338855",
            "4746338855",
            "46338855",
            "96338855"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "nb-NO")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotNBNOMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "",
            "Vml2YW11cyBmZXJtZtesting123",
            "+4676338855",
            "19676338855",
            "+4726338855",
            "4736338855",
            "66338855"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "nb-NO")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - nn-NO locale
    func testIsNNNOMobileNumber() {
        let mobileNumbers = [
            "+4796338855",
            "+4746338855",
            "4796338855",
            "4746338855",
            "46338855",
            "96338855"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "nn-NO")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotNNNOMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "",
            "Vml2YW11cyBmZXJtZtesting123",
            "+4676338855",
            "19676338855",
            "+4726338855",
            "4736338855",
            "66338855"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "nn-NO")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - vi-VN locale
    func testIsVIVNMobileNumber() {
        let mobileNumbers = [
            "01636012403",
            "+841636012403",
            "1636012403",
            "841636012403",
            "+84999999999",
            "84999999999",
            "0999999999",
            "999999999"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "vi-VN")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotVIVNMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "",
            "Vml2YW11cyBmZXJtZtesting123",
            "010-38238383",
            "260976684590"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "vi-VN")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - es-ES locale
    func testIsESESMobileNumber() {
        let mobileNumbers = [
            "+34654789321",
            "654789321",
            "+34714789321",
            "714789321",
            "+34744789321",
            "744789321"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "es-ES")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotESESMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "",
            "Vml2YW11cyBmZXJtZtesting123",
            "+3465478932",
            "65478932",
            "+346547893210",
            "6547893210",
            "+34704789321",
            "704789321",
            "+34754789321",
            "754789321"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "es-ES")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - pl-PL locale
    func testIsPLPLMobileNumber() {
        let mobileNumbers = [
            "+48512689767",
            "+48 56 376 87 47",
            "56 566 78 46",
            "657562855",
            "+48657562855",
            "+48 887472765",
            "+48 56 6572724",
            "+48 67 621 5461",
            "48 67 621 5461"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "pl-PL")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotPLPLMobileNumber() {
        let notMobileNumbers = [
            "+48  67 621 5461",
            "+55657562855",
            "3454535",
            "teststring",
            "",
            "1800-88-8687",
            "+6019-5830837",
            "357562855"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "pl-PL")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - fi-FI locale
    func testIsFIFIMobileNumber() {
        let mobileNumbers = [
            "+358505557171",
            "0455571",
            "0505557171",
            "358505557171",
            "04412345",
            "0457 123 45 67",
            "+358457 123 45 67",
            "+358 50 555 7171"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "fi-FI")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotFIFIMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "",
            "045557",
            "045555717112312332423423421",
            "Vml2YW11cyBmZXJtZtesting123",
            "010-38238383",
            "+3-585-0555-7171",
            "+9676338855",
            "19676338855",
            "6676338855",
            "+99676338855",
            "044123",
            "019123456789012345678901"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "fi-FI")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - ms-MY locale
    func testIsMSMYMobileNumber() {
        let mobileNumbers = [
            "+60128228789",
            "+60195830837",
            "+6019-5830837",
            "+6019-5830837",
            "0128737867",
            "01468987837",
            "016-2838768",
            "016 2838768"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "ms-MY")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotMSMYMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "601238788657",
            "088387675",
            "16-2838768",
            "032551433",
            "6088-387888",
            "088-261987",
            "1800-88-8687",
            "088-320000"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "ms-MY")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - ja-JP locale
    func testIsJAJPMobileNumber() {
        let mobileNumbers = [
            "0312345678",
            "0721234567",
            "09012345688",
            "06 1234 5678",
            "072 123 4567",
            "0729 12 3456",
            "07296 1 2345",
            "072961 2345",
            "090 1234 5678",
            "03-1234-5678",
            "+81312345678",
            "+816-1234-5678",
            "+8190-1234-5678"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "ja-JP")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotJAJPMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "",
            "045555717112312332423423421",
            "Vml2YW11cyBmZXJtZtesting123",
            "+3-585-0555-7171",
            "0 1234 5689",
            "16 1234 5689",
            "03_1234_5689"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "ja-JP")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - it-IT locale
    func testIsITITMobileNumber() {
        let mobileNumbers = [
            "370 3175423",
            "333202925",
            "+39 310 7688449",
            "+39 3339847632"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "it-IT")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotITITMobileNumber() {
        let notMobileNumbers = [
            "011 7387545",
            "12345",
            "+45 345 6782395"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "it-IT")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - fr-BE locale
    func testIsFRBEMobileNumber() {
        let mobileNumbers = [
            "0470123456",
            "+32470123456",
            "32470123456",
            "021234567",
            "+3221234567",
            "3221234567"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "fr-BE")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotFRBEMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "+3212345",
            "3212345",
            "04701234567",
            "+3204701234567",
            "3204701234567",
            "0212345678",
            "+320212345678",
            "320212345678"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "fr-BE")
            XCTAssertEqual(result, false)
        }
    }
    
    // MARK: - nl-BE locale
    func testIsNLBEMobileNumber() {
        let mobileNumbers = [
            "0470123456",
            "+32470123456",
            "32470123456",
            "021234567",
            "+3221234567",
            "3221234567"
        ]
        for mobileNumber in mobileNumbers {
            let result = Validator.isMobilePhone(str: mobileNumber, locale: "nl-BE")
            XCTAssertEqual(result, true)
        }
    }
    
    func testIsNotNLBEMobileNumber() {
        let notMobileNumbers = [
            "12345",
            "+3212345",
            "3212345",
            "04701234567",
            "+3204701234567",
            "3204701234567",
            "0212345678",
            "+320212345678",
            "320212345678"
        ]
        for notMobileNumber in notMobileNumbers {
            let result = Validator.isMobilePhone(str: notMobileNumber, locale: "nl-BE")
            XCTAssertEqual(result, false)
        }
    }
    
}
