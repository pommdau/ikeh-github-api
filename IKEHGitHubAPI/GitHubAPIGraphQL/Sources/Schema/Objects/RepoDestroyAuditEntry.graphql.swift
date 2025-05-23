// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// Audit log entry for a repo.destroy event.
  static let RepoDestroyAuditEntry = ApolloAPI.Object(
    typename: "RepoDestroyAuditEntry",
    implementedInterfaces: [
      Interfaces.AuditEntry.self,
      Interfaces.Node.self,
      Interfaces.OrganizationAuditEntryData.self,
      Interfaces.RepositoryAuditEntryData.self
    ],
    keyFields: nil
  )
}