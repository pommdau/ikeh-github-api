//
//  GitHubAPIClient+login.swift
//  IKEHGitHubAPIDemo
//
//  Created by HIROKI IKEUCHI on 2025/01/20.
//

import Foundation
import SwiftUI
import HTTPTypes
import HTTPTypesFoundation

// MARK: - Token

extension GitHubAPIClient {
    
    /// 初回ログイン時のトークン取得
    func fetchInitialToken(sessionCode: String) async throws {
        let request = GitHubAPIRequest.FetchInitialToken(clientID: GitHubAPIClient.PrivateConstant.clientID,
                                                         clientSecret: GitHubAPIClient.PrivateConstant.clientSecret,
                                                         sessionCode: sessionCode)
        
        let currentTime = Date()
        let response = try await self.sendRequest(with: request)

        await tokenStore.updateTokens(
            accessToken: response.accessToken,
            refreshToken: response.refreshToken,
            accessTokenExpiresAt: currentTime.addingExpirationInterval(response.accessTokenExpiresIn),
            refreshTokenExpiresAt: currentTime.addingExpirationInterval(response.refreshTokenExpiresIn)
        )
    }
    
    /// アクセストークンの更新
    /// - Parameter forceUpdate: 更新を強制する
    func updateAccessTokenIfNeeded(forceUpdate: Bool = false) async throws {
        // 有効なアクセストークンがあれば何もしない
        if !forceUpdate, await tokenStore.isAccessTokenValid {
            return
        }

        // リフレッシュトークンが有効かどうか確認
        guard
            await tokenStore.isRefreshTokenValid,
            let refreshToken = await tokenStore.refreshToken
        else {
            throw GitHubAPIClientError.oauthError("有効な認証情報がありません。再度ログインを行ってください。")
        }
        
        // 更新処理
        let currentTime = Date()
        let request = GitHubAPIRequest.UpdateAccessToken(clientID: GitHubAPIClient.PrivateConstant.clientID,
                                                         clientSecret: GitHubAPIClient.PrivateConstant.clientSecret,
                                                         refreshToken: refreshToken)
        let response = try await self.sendRequest(with: request)
                
        print("accessToken: \(response.accessToken)")
        
        await tokenStore.updateTokens(
            accessToken: response.accessToken,
            refreshToken: response.refreshToken,
            accessTokenExpiresAt: currentTime.addingExpirationInterval(response.accessTokenExpiresIn),
            refreshTokenExpiresAt: currentTime.addingExpirationInterval(response.refreshTokenExpiresIn)
        )
    }
}
