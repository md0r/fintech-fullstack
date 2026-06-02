// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

extension IOUAPI {
  nonisolated struct ChangePasswordMutation: GraphQLMutation {
    static let operationName: String = "ChangePassword"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation ChangePassword($changePasswordInput: ChangePasswordInput!) { changePassword(changePasswordInput: $changePasswordInput) }"#
      ))

    public var changePasswordInput: ChangePasswordInput

    public init(changePasswordInput: ChangePasswordInput) {
      self.changePasswordInput = changePasswordInput
    }

    @_spi(Unsafe) public var __variables: Variables? { ["changePasswordInput": changePasswordInput] }

    nonisolated struct Data: IOUAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { IOUAPI.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("changePassword", Bool.self, arguments: ["changePasswordInput": .variable("changePasswordInput")]),
      ] }
      static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ChangePasswordMutation.Data.self
      ] }

      /// Change user password
      var changePassword: Bool { __data["changePassword"] }
    }
  }

}