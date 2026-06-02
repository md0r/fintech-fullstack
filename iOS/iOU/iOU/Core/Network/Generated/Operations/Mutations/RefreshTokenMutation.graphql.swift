// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

extension IOUAPI {
  nonisolated struct RefreshTokenMutation: GraphQLMutation {
    static let operationName: String = "RefreshToken"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation RefreshToken($refreshTokenInput: RefreshTokenInput!) { refreshToken(refreshTokenInput: $refreshTokenInput) { __typename accessToken refreshToken user { __typename ...UserFields } } }"#,
        fragments: [UserFields.self]
      ))

    public var refreshTokenInput: RefreshTokenInput

    public init(refreshTokenInput: RefreshTokenInput) {
      self.refreshTokenInput = refreshTokenInput
    }

    @_spi(Unsafe) public var __variables: Variables? { ["refreshTokenInput": refreshTokenInput] }

    nonisolated struct Data: IOUAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { IOUAPI.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("refreshToken", RefreshToken.self, arguments: ["refreshTokenInput": .variable("refreshTokenInput")]),
      ] }
      static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        RefreshTokenMutation.Data.self
      ] }

      /// Refresh access token using refresh token
      var refreshToken: RefreshToken { __data["refreshToken"] }

      /// RefreshToken
      ///
      /// Parent Type: `AuthResponse`
      nonisolated struct RefreshToken: IOUAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { IOUAPI.Objects.AuthResponse }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("accessToken", String.self),
          .field("refreshToken", String.self),
          .field("user", User.self),
        ] }
        static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          RefreshTokenMutation.Data.RefreshToken.self
        ] }

        var accessToken: String { __data["accessToken"] }
        var refreshToken: String { __data["refreshToken"] }
        var user: User { __data["user"] }

        /// RefreshToken.User
        ///
        /// Parent Type: `User`
        nonisolated struct User: IOUAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { IOUAPI.Objects.User }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(UserFields.self),
          ] }
          static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            RefreshTokenMutation.Data.RefreshToken.User.self,
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

}