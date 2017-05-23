//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

import Foundation

final class SyncNetworkClient: NSObject, NetworkClient {

    let config: NetworkClientConfig

    let requestFactory: RequestFactory
    let serialization: DataSerialization
    let responseProcessor: ResponseProcessor
    let logger: Logger

    init(requestFactory: RequestFactory, serialization: DataSerialization,
        responseProcessor: ResponseProcessor, logger: Logger, config: NetworkClientConfig) {

        self.requestFactory = requestFactory
        self.serialization = serialization
        self.responseProcessor = responseProcessor
        self.logger = logger
        self.config = config
    }

    func request(_ request: NetworkRequest) throws -> NetworkResponse {

        logger.debug("\(request)")

        let urlRequest = requestFactory.createNSURLRequest(request)

        let (data, urlResponse) = try sendSynchronousRequest(urlRequest as URLRequest)

        let responseBody = try? deserializeData(data)

        let response = try responseProcessor.parseResponse(responseBody,
            httpUrlResponse: urlResponse)

        logger.debug("\(response)")

        return response
    }

    fileprivate func sendSynchronousRequest(_ urlRequest: URLRequest) throws
        -> (Data, HTTPURLResponse) {

        var urlData: Data?
        var urlResponse: URLResponse?
        var urlError: NSError?

        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)

            let conf = URLSessionConfiguration.default
            let session = Foundation.URLSession(
                configuration: conf,
                delegate: self,
                delegateQueue: nil
            )

            session.dataTask(with: urlRequest) { data, response, error in
                urlData = data
                urlResponse = response
                urlError = error as NSError?

                semaphore.signal()
                }
                .resume()

        let _ = semaphore.wait(timeout: DispatchTime.distantFuture)

        if let error = urlError {
            logger.error(error)
            throw NetworkClientError.networkConnectionError
        }

        guard let data = urlData, let httpUrlResponse = urlResponse  as? HTTPURLResponse else {
            throw NetworkClientError.serverError
        }

        return (data, httpUrlResponse)
    }

    fileprivate func deserializeData(_ data: Data) throws -> Any {
        do {
            return try serialization.deserializeData(data)
        } catch let error as DataSerializationError {
            logger.error(error)
            throw NetworkClientError.serverError
        }
    }
}

extension SyncNetworkClient: URLSessionDelegate {

    func urlSession(
        _ session: URLSession,
        didReceive challenge: URLAuthenticationChallenge,
        completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void
    ) {
        if config.allowInvalidCertificates {
            completionHandler(.useCredential,
                              URLCredential(trust: challenge.protectionSpace.serverTrust!))
        } else {
            completionHandler(.performDefaultHandling, nil)
        }
    }
}
