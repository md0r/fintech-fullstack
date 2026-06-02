// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

extension IOUAPI {
  nonisolated struct DeleteAccountMutation: GraphQLMutation {
    static let operationName: String = "DeleteAccount"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation DeleteAccount { deleteAccount }"#
      ))

    public init() {}

    nonisolated struct Data: IOUAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { IOUAPI.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("deleteAccount", Bool.self),
      ] }
      static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        DeleteAccountMutation.Data.self
      ] }

      /// Soft delete user account (marks as inactive)
      var deleteAccount: Bool { __data["deleteAccount"] }
    }
  }

}