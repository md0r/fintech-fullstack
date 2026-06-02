// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

extension IOUAPI {
  nonisolated struct UserFields: IOUAPI.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment UserFields on User { __typename id email firstName lastName isActive createdAt updatedAt }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: any ApolloAPI.ParentType { IOUAPI.Objects.User }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", IOUAPI.ID.self),
      .field("email", String.self),
      .field("firstName", String.self),
      .field("lastName", String.self),
      .field("isActive", Bool.self),
      .field("createdAt", IOUAPI.DateTime.self),
      .field("updatedAt", IOUAPI.DateTime.self),
    ] }
    static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      UserFields.self
    ] }

    var id: IOUAPI.ID { __data["id"] }
    var email: String { __data["email"] }
    var firstName: String { __data["firstName"] }
    var lastName: String { __data["lastName"] }
    var isActive: Bool { __data["isActive"] }
    var createdAt: IOUAPI.DateTime { __data["createdAt"] }
    var updatedAt: IOUAPI.DateTime { __data["updatedAt"] }
  }

}