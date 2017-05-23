//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

import Swinject

public var networkClientConfig: NetworkClientConfig!

enum SerializationType: String {
    case jsonSerialization
    case stringSerialization
}

final class NetworkingAssembly: Assembly {

    func assemble(container: Container) {

        container.register(DataSerialization.self,
            name: SerializationType.jsonSerialization.rawValue) { resolvable in

            JSONDataSerialization(logger: resolvable.resolve(Logger.self)!)
        }

        container.register(DataSerialization.self,
            name: SerializationType.stringSerialization.rawValue) { resolvable in

            StringDataSerialization(logger: resolvable.resolve(Logger.self)!)
        }

        container.register(RequestFactory.self) { _ in
            URLRequestFactory()
        }

        container.register(ResponseProcessor.self) { _ in
            HTTPURLResponseProcessor()
        }

        container.register(NetworkClient.self,
            name: SerializationType.jsonSerialization.rawValue) { resolvable in

            let serialization = resolvable.resolve(DataSerialization.self,
                name: SerializationType.jsonSerialization.rawValue)!

            return SyncNetworkClient(
                requestFactory: resolvable.resolve(RequestFactory.self)!,
                serialization: serialization,
                responseProcessor: resolvable.resolve(ResponseProcessor.self)!,
                logger: resolvable.resolve(Logger.self)!,
                config: resolvable.resolve(NetworkClientConfig.self)!
            )
        }

        container.register(NetworkClient.self,
            name: SerializationType.stringSerialization.rawValue) { resolvable in

                let serialization = resolvable.resolve(DataSerialization.self,
                    name: SerializationType.stringSerialization.rawValue)!

                return SyncNetworkClient(
                    requestFactory: resolvable.resolve(RequestFactory.self)!,
                    serialization: serialization,
                    responseProcessor: resolvable.resolve(ResponseProcessor.self)!,
                    logger: resolvable.resolve(Logger.self)!,
                    config: resolvable.resolve(NetworkClientConfig.self)!
                )
        }

        container.register(NetworkClient.self) { r in
            r.resolve(NetworkClient.self, name: SerializationType.jsonSerialization.rawValue)!
        }

        container.register(EmptyDtoDomainConverter.self) { _ in EmptyDtoDomainConverterImpl() }
        container.register(EmptyRequestExternalConverter<EmptyRequest>.self) { _ in
            EmptyRequestExternalConverterImpl<EmptyRequest>()
        }

        container.register(NetworkClientConfig.self) { _ in networkClientConfig }
    }
}
