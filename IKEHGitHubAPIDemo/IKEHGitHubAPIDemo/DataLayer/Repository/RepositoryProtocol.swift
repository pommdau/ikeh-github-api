//
//  RepositoryProtocol.swift
//  IKEHGitHubAPIDemo
//
//  Created by HIROKI IKEUCHI on 2025/01/31.
//

import Foundation

protocol RepositoryProtocol {
    
    associatedtype Item: Identifiable & Codable & Sendable where Item.ID: Codable & Sendable
    associatedtype Backend: BackendProtocol where Backend.Item == Item
    var backend: Backend { get }
    
    // MARK: CRUD
    func addValue(_ value: Item) async throws
    func addValues(_ values: [Item]) async throws
    func fetchValue(for id: Item.ID) async throws -> Item?
    func fetchValues(for ids: [Item.ID]) async throws -> [Item]
    func fetchValuesAll() async throws -> [Item]
    func deleteValue(for id: Item.ID) async throws
    func deleteValues(for ids: [Item.ID]) async throws
    func deleteAll() async throws
}

extension RepositoryProtocol {
    
    // MARK: - CRUD
    
    // MARK: Create / Update
        
    func addValue(_ value: Item) async throws {
        try await backend.addValue(value)
    }
    func addValues(_ values: [Item]) async throws {
        try await backend.addValues(values)
    }
    
    // MARK: Read

    func fetchValue(for id: Item.ID) async throws -> Item? {
        try await backend.fetchValue(for: id)
    }
    func fetchValues(for ids: [Item.ID]) async throws -> [Item] {
        try await backend.fetchValues(for: ids)
    }
    
    func fetchValuesAll() async throws -> [Item] {
        try await backend.fetchValuesAll()
    }
    
    // MARK: Delete
    
    func deleteValue(for id: Item.ID) async throws {
        try await backend.deleteValue(for: id)
    }
    func deleteValues(for ids: [Item.ID]) async throws {
        try await backend.deleteValues(for: ids)
    }
    func deleteAll() async throws {
        try await backend.deleteAll()
    }
}
