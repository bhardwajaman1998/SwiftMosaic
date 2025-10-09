
//
//  SwiftUICoreHelpersTests.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-09.
//

import XCTest
@testable import SwiftUICore

final class SwiftUICoreHelpersTests: XCTestCase {
    func testBooleanBindingToggle() {
        var flag = false
        let binding = Binding(get: { flag }, set: { flag = $0 })
        BooleanBinding(binding).toggle()
        XCTAssertTrue(flag)
    }
}
