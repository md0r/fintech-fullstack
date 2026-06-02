// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

extension IOUAPI {
  nonisolated struct SignupMutation: GraphQLMutation {
    static let operationName: String = "Signup"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation Signup($signupInput: SignupInput!) { signup(signupInput: $signupInput) { __typename accessToken refreshToken user { __typename ...UserFields } } }"#,
        fragments: [UserFields.self]
      ))

    public var signupInput: SignupInput

    public init(signupInput: SignupInput) {
      self.signupInput = signupInput
    }

    @_spi(Unsafe) public var __variables: Variables? { ["signupInput": signupInput] }

    nonisolated struct Data: IOUAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { IOUAPI.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("signup", Signup.self, arguments: ["signupInput": .variable("signupInput")]),
      ] }
      static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        SignupMutation.Data.self
      ] }

      /// Register a new user account
      var signup: Signup { __data["signup"] }

      /// Signup
      ///
      /// Parent Type: `AuthResponse`
      nonisolated struct Signup: IOUAPI.SelectionSet {
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
          SignupMutation.Data.Signup.self
        ] }

        var accessToken: String { __data["accessToken"] }
        var refreshToken: String { __data["refreshToken"] }
        var user: User { __data["user"] }

        /// Signup.User
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
            SignupMutation.Data.Signup.User.self,
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