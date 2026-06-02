// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

extension IOUAPI {
  nonisolated struct ChangePasswordInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      newPassword: String,
      oldPassword: String
    ) {
      __data = InputDict([
        "newPassword": newPassword,
        "oldPassword": oldPassword
      ])
    }

    var newPassword: String {
      get { __data["newPassword"] }
      set { __data["newPassword"] = newValue }
    }

    var oldPassword: String {
      get { __data["oldPassword"] }
      set { __data["oldPassword"] = newValue }
    }
  }

}