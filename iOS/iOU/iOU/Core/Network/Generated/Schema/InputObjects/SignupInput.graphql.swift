// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

extension IOUAPI {
  nonisolated struct SignupInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      email: String,
      firstName: String,
      lastName: String,
      password: String
    ) {
      __data = InputDict([
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "password": password
      ])
    }

    var email: String {
      get { __data["email"] }
      set { __data["email"] = newValue }
    }

    var firstName: String {
      get { __data["firstName"] }
      set { __data["firstName"] = newValue }
    }

    var lastName: String {
      get { __data["lastName"] }
      set { __data["lastName"] = newValue }
    }

    var password: String {
      get { __data["password"] }
      set { __data["password"] = newValue }
    }
  }

}