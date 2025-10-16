//
//  GCDHelpersTests.swift
//  SwiftMosaic
//
//  Created by Aman Bhardwaj on 2025-10-07.
//
//#if canImport(XCTest)
//import XCTest
//@testable import SwiftCore
//
//final class GCDHelpersTests: XCTestCase {
//    func testAfterExecutes() {
//        let exp = expectation(description: "after() runs")
//        after(0.1) { exp.fulfill() }
//        wait(for: [exp], timeout: 1)
//    }
//
//    func testMainAsyncExecutesOnMainThread() {
//        let exp = expectation(description: "mainAsync runs on main")
//        background {
//            mainAsync {
//                XCTAssertTrue(Thread.isMainThread)
//                exp.fulfill()
//            }
//        }
//        wait(for: [exp], timeout: 1)
//    }
//}
//#endif // canImport(XCTest)
