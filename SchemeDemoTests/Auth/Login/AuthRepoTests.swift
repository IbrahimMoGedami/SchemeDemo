//
//  AuthRepoTests.swift
//  SchemeDemoTests
//
//  Created by Ibrahim Mo Gedami on 2/18/24.
//

import XCTest
@testable import SchemeDemo

class AuthRepoTests: XCTestCase {
    
    var authRepo: AuthRepo!
    var mockNetwork: MockNetwork!
    
    override func setUp() {
        mockNetwork = MockNetwork()
        authRepo = AuthRepo(network: mockNetwork)
    }
    
    override func tearDown() {
        authRepo = nil
        mockNetwork = nil
    }
    
    func testLoginSuccess() {
        // Given
        mockNetwork.loginShouldSucceed = true
        let loginBody = LoginBody(/* provide necessary data */)
        
        // When
        authRepo.login(body: loginBody) { result in
            // Then
            switch result {
            case .success(let userData):
                // Assert success case
                XCTAssertEqual(userData.status, "success")
                // Add more assertions as needed based on your UserDataModel
            case .error(let error):
                XCTFail("Login should succeed, but received error: \(error)")
            }
        }
    }
    
    func testLoginFailureTimeout() {
        // Given
        mockNetwork.loginShouldSucceed = false
        mockNetwork.capturedRequest = nil // Reset captured request
        
        let loginBody = LoginBody(phoneNumber: "1234567890", password: "password123")
        
        // Create an expectation for the timeout error
        let expectation = self.expectation(description: "Expected the login operation to fail with a timeout error")
        
        // When
        authRepo.login(body: loginBody) { result in
            // Then
            switch result {
            case .success(let userData):
                XCTFail("Login should fail, but received success with data: \(userData)")
            case .error(let error):
                // Assert failure case
                XCTAssertEqual(error, AppError.timeOut)
                // Fulfill the expectation when the assertion is completed
                expectation.fulfill()
            }
        }
        // Wait for the expectation to be fulfilled or timeout after 5 seconds
        waitForExpectations(timeout: 5, handler: nil)
    }

    
}
