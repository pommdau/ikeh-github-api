//
//  GitHubAPIClient+shared.swift
//  GitHubRepositorySearch
//
//  Created by HIROKI IKEUCHI on 2025/04/30.
//

import Foundation
import class IKEHGitHubAPIClient.GitHubAPIClient

extension GitHubAPIClient {
    
    /// GitHubAPIClientのシングルトン
    static let shared: GitHubAPIClient = .init(
        clientID: GitHubAPICredentials.clientID,
        clientSecret: GitHubAPICredentials.clientSecret,
        // swiftlint:disable:next force_unwrapping
        callbackURL: URL(string: "ikeh-github-repository-search://callback")!,
        // ログインユーザのリポジトリを取得するためにスコープの設定が必要
        scope: "repo",
        urlSession: URLSession.shared
    )
}

/// Protocolはライブラリで実装済みのメソッドのみなので継承のみ
//extension GitHubAPIClient: GitHubAPIClientProtocol {}
