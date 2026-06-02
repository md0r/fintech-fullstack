// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

extension IOUAPI {
  nonisolated struct UpdateUserInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      firstName: GraphQLNullable<String> = nil,
      lastName: GraphQLNullable<String> = nil
    ) {
      __data = InputDict([
        "firstName": firstName,
        "lastName": lastName
      ])
    }

    var firstName: GraphQLNullable<String> {
      get { __data["firstName"] }
      set { __data["firstName"] = newValue }
    }

    var lastName: GraphQLNullable<String> {
      get { __data["lastName"] }
      set { __data["lastName"] = newValue }
    }
  }

}