//
//  Store_Front_SellachaTests.swift
//  Store Front-SellachaTests
//
//  Created by Subaykala on 03/01/24.
//

import XCTest
@testable import Store_Front_Sellacha

final class Store_Front_SellachaTests: XCTestCase {
    var sut: SignInViewModel!
    var loginApiSerice: MockLoginApiSevice!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
        self.loginApiSerice = MockLoginApiSevice()
        self.sut = SignInViewModel(apiServices: loginApiSerice)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let loginModel = LoginModel()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class MockLoginApiSevice: LoginApiServiceprotocol {
    var responseClosure: ((Bool?, String?, AnyObject?, String?)->())?
    func makeLogin(finalURL: String, httpHeaders: [String : String], withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
        responseClosure = { [weak self] (Bool, String, AnyObject, String) in
            DispatchQueue.main.async {
                guard let self = self else {return}
              completion(Bool, String, AnyObject, String)
            }
        }
    }
    
    func makeSignUp(finalURL: String, httpHeaders: [String : String], withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
        responseClosure = { [weak self] (Bool, String, AnyObject, String) in
            DispatchQueue.main.async {
                guard let self = self else {return}
              completion(Bool, String, AnyObject, String)
            }
        }
    }
}


