//
//  RepoRepository.swift
//  IKEHGitHubAPIDemo
//
//  Created by HIROKI IKEUCHI on 2025/01/28.
//

import Foundation

protocol RepoRepositoryProtocol: Sendable {
    
    var backend: RepoBackendProtocol { get }
    
    // MARK: CRUD
    func addValue(_ value: Repo) async throws
    func addValues(_ values: [Repo]) async throws
    func fetchValue(for ids: [Repo.ID]) async throws -> [Repo]
    func fetchAllValues() async throws -> [Repo]
    func updateValue(_ value: Repo) async throws
    func deleteValues(for ids: [Repo.ID]) async throws
    func deleteAllValues() async throws
}

final class RepoRepository: RepoRepositoryProtocol {
    
    static let shared: RepoRepository = .init()
        
    let backend: RepoBackendProtocol
    
    init(backend: RepoBackendProtocol) {
        self.backend = backend
    }
    
    convenience init() {
        self.init(backend: RepoBackend.shared)
    }
}

// MARK: - CRUD

extension RepoRepository {

    // MARK: Create
    
    func addValue(_ value: Repo) async throws {
        try await backend.add(value)
    }
    
    func addValues(_ values: [Repo]) async throws {
        try await backend.add(values)
    }
    
    // MARK: Read
    
    func fetchValue(for ids: [Repo.ID]) async throws -> [Repo] {
        return try await backend.read(for: ids)
    }
    
    func fetchAllValues() async throws -> [Repo] {
        try await backend.readAll()
    }
    
    // MARK: Update
        
    func updateValue(_ value: Repo) async throws {
        try await backend.add(value)
    }
    
    // MARK: Delete
    
    func deleteValues(for ids: [Repo.ID]) async throws {
        try await backend.delete(for: ids)
    }
    
    func deleteAllValues() async throws {
        try await backend.deleteAll()
    }
}
