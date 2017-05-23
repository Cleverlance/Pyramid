//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

internal final class AppVersionGetterPlatformServiceImpl: AppVersionGetterService {

    override func execute(_: NoInput) throws -> AppVersion {
        let string = Bundle.main
            .object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String

        return AppVersion(string ?? "")
    }
}
