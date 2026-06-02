import Foundation

struct AuthTokensEntity {
    let accessToken: String
    let refreshToken: String
    let user: UserEntity
}
