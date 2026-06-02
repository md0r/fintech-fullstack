// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

extension IOUAPI {
  nonisolated struct LogoutMutation: GraphQLMutation {
    static let operationName: String = "Logout"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation Logout { logout }"#
      ))

    public init() {}

    nonisolated struct Data: IOUAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { IOUAPI.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("logout", Bool.self),
      ] }
      static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        LogoutMutation.Data.self
      ] }

      /// Logout user and invalidate refresh token
      var logout: Bool { __data["logout"] }
    }
  }

}