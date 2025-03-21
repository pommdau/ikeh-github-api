//
//  GitHubAPIClient+FetchLoginUser.swift
//  IKEHGitHubAPIDemo
//
//  Created by HIROKI IKEUCHI on 2025/01/27.
//

import Foundation

extension GitHubAPIClient {
    func fetchLoginUser() async throws -> LoginUser {
        guard let accessToken = await tokenStore.accessToken else {
            throw GitHubAPIClientError.oauthError("有効なトークンが見つかりませんでした")
        }
        let request = GitHubAPIRequest.FetchLoginUser(accessToken: accessToken)
        let response = try await sendRequest(with: request)
        return response
    }
}
