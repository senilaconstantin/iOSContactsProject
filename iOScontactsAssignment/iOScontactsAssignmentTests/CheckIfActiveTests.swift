//
//  CheckIfActiveTests.swift
//  iOScontactsAssignmentTests
//
//  Created by Constantin Senila on 31.01.2024.
//

import XCTest
@testable import iOScontactsAssignment

final class CheckIfActiveTests: XCTestCase {
    func testSuccessfulIfContactActive() {
        // Given
        let status: String = "active"
        let contactVM: ContactViewModel = ContactViewModel()
        
        // When
        let isActive: Bool = contactVM.isActive(status: status)
        
        // Then (assert)
        XCTAssertEqual(isActive, true)
        
    }
    
    func testErrorIfContactActive() {
        // Given
        let status: String = "inactive"
        let contactVM: ContactViewModel = ContactViewModel()
        
        // When
        let isActive: Bool = contactVM.isActive(status: status)
        
        // Then (assert)
        XCTAssertEqual(isActive, false)
        
    }
}
