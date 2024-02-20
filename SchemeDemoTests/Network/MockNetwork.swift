//
//  MockNetwork.swift
//  SchemeDemoTests
//
//  Created by Ibrahim Mo Gedami on 2/18/24.
//

import Foundation
@testable import SchemeDemo

class MockNetwork: NetworkProtocol {
    
    var loginShouldSucceed: Bool = true // Control whether login should succeed or fail
    var capturedRequest: URLRequestConvertible?
    
    func request<T>(_ request: URLRequestConvertible, decodeTo type: T.Type, completionHandler: @escaping NetworkCompletion<T>) where T : BaseCodable {
        capturedRequest = request
        
        // Simulate success or failure based on `loginShouldSucceed`
        if loginShouldSucceed {
            if let userDataModel = UserDataModel.mock() as? T {
                completionHandler(.success(userDataModel))
            } else {
                // Handle type casting failure if needed
                let error = AppError.customeError("Failed to cast mock data to type \(T.self)")
                completionHandler(.error(error))
            }
        } else {
            // Simulate timeout error
            let error = AppError.timeOut
            completionHandler(.error(error))
        }
    }

    func upload<T>(_ request: URLRequestConvertible, data: [UploadData], decodedTo type: T.Type, completionHandler: @escaping NetworkCompletion<T>) where T : BaseCodable {
        // Implement upload method if needed for testing
    }
    
    func cancelAllRequests() {
        // Implement cancelAllRequests method if needed for testing
    }
    
}
