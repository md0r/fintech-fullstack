// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

nonisolated protocol IOUAPI_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == IOUAPI.SchemaMetadata {}

nonisolated protocol IOUAPI_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == IOUAPI.SchemaMetadata {}

nonisolated protocol IOUAPI_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == IOUAPI.SchemaMetadata {}

nonisolated protocol IOUAPI_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == IOUAPI.SchemaMetadata {}

extension IOUAPI {
  typealias SelectionSet = IOUAPI_SelectionSet

  typealias InlineFragment = IOUAPI_InlineFragment

  typealias MutableSelectionSet = IOUAPI_MutableSelectionSet

  typealias MutableInlineFragment = IOUAPI_MutableInlineFragment

  nonisolated enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    private static let objectTypeMap: [String: ApolloAPI.Object] = [
      "AuthResponse": IOUAPI.Objects.AuthResponse,
      "Mutation": IOUAPI.Objects.Mutation,
      "Query": IOUAPI.Objects.Query,
      "User": IOUAPI.Objects.User
    ]

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      objectTypeMap[typename]
    }
  }

  nonisolated enum Objects {}
  nonisolated enum Interfaces {}
  nonisolated enum Unions {}

}