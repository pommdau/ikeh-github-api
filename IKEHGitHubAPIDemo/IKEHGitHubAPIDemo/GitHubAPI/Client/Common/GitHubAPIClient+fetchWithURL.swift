//
//  GitHubAPIClient+fetchWithURL.swift
//  IKEHGitHubAPIDemo
//
//  Created by HIROKI IKEUCHI on 2025/02/26.
//

import Foundation

extension GitHubAPIClient {
    /// クエリを含む完全なURLが分かっている場合に利用できるGET用API通信
    func fetchWithURL<Response: Decodable>(url: URL) async throws -> Response {
        let request = await GitHubAPIRequest.RequestWithURL<Response>(accessToken: tokenStore.accessToken, rawURL: url)
        let response = try await sendRequest(with: request)
        return response
    }
    
    // TODO: remove
    func fetchLoginUserPinnedRepos(userName: String) async throws -> ListResponse<Repo> {
        let request = await GitHubAPIRequest.FetchLoginUserPinnedRepos(userName: userName, accessToken: tokenStore.accessToken)
        let response = try await sendRequest(with: request)
        return response
    }
}
