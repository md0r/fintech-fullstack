import SwiftUI

struct AuthTextField: View {
    let title: String
    @Binding var text: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var textContentType: UITextContentType?

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)

            Group {
                if isSecure {
                    SecureField("", text: $text)
                } else {
                    TextField("", text: $text)
                        .keyboardType(keyboardType)
                }
            }
            .textContentType(textContentType)
            .autocorrectionDisabled()
            .textInputAutocapitalization(isSecure ? .never : .never)
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(.quaternary, in: RoundedRectangle(cornerRadius: 12))
        }
    }
}
