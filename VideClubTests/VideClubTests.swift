//
//  VideClubTests.swift
//  VideClubTests
//
//  Created by Boris Chirino on 1/9/22.
//

import XCTest
@testable import VideClub
import ModelLibrary

class VideClubTests: XCTestCase {
    let jsonDecoder = JSONDecoder()
    var testData: Data?
    var testDataIncomplete: Data?
    let httpURL = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"

    
    override func setUpWithError() throws {
        let urlcomplete = Bundle.main.url(forResource: "response", withExtension: "json")
        let urlIncomplete = Bundle.main.url(forResource: "response_incomplete", withExtension: "json")
        testData = try! Data(contentsOf: urlcomplete!)
        testDataIncomplete = try! Data(contentsOf: urlIncomplete!)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecoder_catalog_response_decoding() {
        guard let jsonData = self.testData else { return }
        let object = try! jsonDecoder.decode(Catalog.self, from: jsonData)
        XCTAssertNotNil(object)
    }
    
    func testDecoder_catalog_response_decoding_categories_count() {
        guard let jsonData = self.testData else { return }
        let object = try! jsonDecoder.decode(Catalog.self, from: jsonData)
        XCTAssertEqual(object.categories.count, 1)
    }

    func testDecoder_catalog_response_decoding_category_first_videos_count() {
        guard let jsonData = self.testData else { return }
        let object = try! jsonDecoder.decode(Catalog.self, from: jsonData)
        XCTAssertEqual(object.categories.first?.videos.count, 13)
    }
    
    func testDecoder_incomplete_decoding_success() {
        guard let jsonData = self.testDataIncomplete else { return }
        let object = try! jsonDecoder.decode(Catalog.self, from: jsonData)
        XCTAssertNotNil(object)
    }
    
    
}
