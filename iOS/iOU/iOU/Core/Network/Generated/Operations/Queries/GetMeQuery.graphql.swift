// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

extension IOUAPI {
  nonisolated struct GetMeQuery: GraphQLQuery {
    static let operationName: String = "GetMe"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetMe { getMe { __typename ...UserFields } }"#,
        fragments: [UserFields.self]
      ))

    public init() {}

    nonisolated struct Data: IOUAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { IOUAPI.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("getMe", GetMe.self),
      ] }
      static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetMeQuery.Data.self
      ] }

      /// Get current authenticated user profile
      var getMe: GetMe { __data["getMe"] }

      /// GetMe
      ///
      /// Parent Type: `User`
      nonisolated struct GetMe: IOUAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { IOUAPI.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(UserFields.self),
        ] }
        static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetMeQuery.Data.GetMe.self,
          UserFields.self
        ] }

        var id: IOUAPI.ID { __data["id"] }
        var email: String { __data["email"] }
        var firstName: String { __data["firstName"] }
        var lastName: String { __data["lastName"] }
        var isActive: Bool { __data["isActive"] }
        var createdAt: IOUAPI.DateTime { __data["createdAt"] }
        var updatedAt: IOUAPI.DateTime { __data["updatedAt"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var userFields: UserFields { _toFragment() }
        }
      }
    }
  }

}