// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// A review object for a given pull request.
  static let PullRequestReview = ApolloAPI.Object(
    typename: "PullRequestReview",
    implementedInterfaces: [
      Interfaces.Comment.self,
      Interfaces.Deletable.self,
      Interfaces.Minimizable.self,
      Interfaces.Node.self,
      Interfaces.Reactable.self,
      Interfaces.RepositoryNode.self,
      Interfaces.Updatable.self,
      Interfaces.UpdatableComment.self
    ],
    keyFields: nil
  )
}