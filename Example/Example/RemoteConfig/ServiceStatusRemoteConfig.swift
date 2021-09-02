//
//  ServiceStatusRemoteConfig.swift
//  Example
//
//  Created by Saika Natsui on 2020/11/06.
//  Copyright © 2020 FidelityWires. All rights reserved.
//

import Foundation
import StawmServiceStatus
import FirebaseRemoteConfig

final class ServiceStatusRemoteConfig: ServiceStatusRemoteConfigProtocol {

    /// Remote Config
    private let remoteConfig: RemoteConfig = {
        let config = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        #if DEBUG
        settings.minimumFetchInterval = 0
        #endif
        settings.fetchTimeout = 5.0
        config.configSettings = settings
        return config
    }()

    init?() {
        // Make sure that only Debug builds get RemoteConfig.
        #if DEBUG
        #else
        return nil
        #endif
    }

    func fetchAndActivate(completion: @escaping (Result<Bool, Error>) -> Void) {
        remoteConfig.fetchAndActivate { (status, error) in
            if let error = error {
                completion(.failure(error))
            }
            completion(.success(status == .successFetchedFromRemote))
        }
    }

    func fetchedValues(for keys: [String]) -> [String: String] {
        return keys.reduce(into: [String: String]()) { (sum, key) in
            guard let value = remoteConfig[key].stringValue else {
                return
            }
            sum[key] = value
        }
    }
}
