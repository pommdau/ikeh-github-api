//
//  ProfileViewState.swift
//  IKEHGitHubAPIDemo
//
//  Created by HIROKI IKEUCHI on 2025/01/23.
//

import SwiftUI

@MainActor
@Observable
final class ProfileViewState {
    
    // MARK: - Property
        
    let loginUserStore: LoginUserStore
    let githubAPIClient: GitHubAPIClient
    var error: Error?
    
    var loginUser: LoginUser? {
        loginUserStore.loginUser
    }
    
    // MARK: - LifeCycle
    
    init(loginUserStore: LoginUserStore = .shared, githubAPIClient: GitHubAPIClient = .shared) {
        self.loginUserStore = loginUserStore
        self.githubAPIClient = githubAPIClient
    }
    
    // MARK: - Actions
        
    func handleLogInButtonTapped() {
        Task {
            do {
                try await githubAPIClient.openLoginPageInBrowser()
            } catch {
                self.error = error
            }
        }
    }
}
