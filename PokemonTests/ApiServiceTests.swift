//
//  ApiServiceTests.swift
//  PokemonTests
//
//  Created by norelhoda on 4.02.2022.
//

import XCTest
@testable import Pokemon

class ApiServiceTests: XCTestCase {
    
    var sut : Services?

    override func setUpWithError() throws {
      sut = Services()
    }

    override func tearDownWithError() throws {
      sut = nil
    }

    func test_fetch_charchters() {
        

              let promise = XCTestExpectation(description: "Fetch charchters completed")
              var responseError: Error?
              var responseCahrchters: [Results]?

              // When
              guard let bundle = Bundle.unitTest.path(forResource: "stub", ofType: "json") else {
                  XCTFail("Error: content not found")
                  return
              }
              
            sut?.getCharchterList(url: URL(fileURLWithPath: bundle), successCompletion: { charchters in
                  //responseError = error
             responseCahrchters = charchters.results
                  promise.fulfill()
              })
              wait(for: [promise], timeout: 1)

              // Then
              XCTAssertNil(responseError)
              XCTAssertNotNil(responseCahrchters)
    }
}
