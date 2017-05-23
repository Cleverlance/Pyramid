//
//  SyncNetworkClientTests.swift
//  Creditas
//
//  Created by Ondrej Fabian on 12/02/16.
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
@testable import Pyramid

class SyncNetworkClientTests: XCTestCase {

    func testSyncClientNetworkError() {
        let client = SyncNetworkClient(requestFactory: TestRequestFactoryOk(),
            serialization: TestDataSerializationNok(),
            responseProcessor: TestResponseProcessorNok(),
            logger: TestLogger(),
            config: NetworkClientConfigDummy())
        let request = NetworkRequest(url: "http://url", method: .get, contentType: .json,
            headers: nil, params: nil)

        do {
            _ = try client.request(request)
            XCTFail()
        } catch NetworkClientError.networkConnectionError {
            XCTAssertTrue(true)
        } catch {
            XCTFail("\(error)")
        }
    }

    func testSyncNetworkClientImplementNSURLSessionDelegate() {
        let _: URLSessionDelegate?
        = (nil as SyncNetworkClient?)
    }
}

private class TestRequestFactoryOk: RequestFactory {
    fileprivate func createNSURLRequest(_ networkRequest: NetworkRequest) -> URLRequest {
        return URLRequest(url: URL(string: "google.com")!)
    }
}

private class TestDataSerializationNok: DataSerialization {
    fileprivate func deserializeData(_ data: Data) throws -> Any {
        throw DataSerializationError.serializationError
    }
}

private class TestResponseProcessorNok: ResponseProcessor {
    fileprivate func parseResponse(_ responseRawBody: Any?, httpUrlResponse: HTTPURLResponse)
        throws -> NetworkResponse {

        return NetworkResponse(status: 500, headers: nil, body: nil)
    }
}
