// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

extension IOUAPI {
  nonisolated struct UpdateUserMutation: GraphQLMutation {
    static let operationName: String = "UpdateUser"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation UpdateUser($updateUserInput: UpdateUserInput!) { updateUser(updateUserInput: $updateUserInput) { __typename ...UserFields } }"#,
        fragments: [UserFields.self]
      ))

    public var updateUserInput: UpdateUserInput

    public init(updateUserInput: UpdateUserInput) {
      self.updateUserInput = updateUserInput
    }

    @_spi(Unsafe) public var __variables: Variables? { ["updateUserInput": updateUserInput] }

    nonisolated struct Data: IOUAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { IOUAPI.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("updateUser", UpdateUser.self, arguments: ["updateUserInput": .variable("updateUserInput")]),
      ] }
      static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        UpdateUserMutation.Data.self
      ] }

      /// Update user profile information
      var updateUser: UpdateUser { __data["updateUser"] }

      /// UpdateUser
      ///
      /// Parent Type: `User`
      nonisolated struct UpdateUser: IOUAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { IOUAPI.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(UserFields.self),
        ] }
        static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          UpdateUserMutation.Data.UpdateUser.self,
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