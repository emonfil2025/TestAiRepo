import SwiftUI

struct TarjetaPerfilFiscalView: View {
    private let qrImageURL = URL(string: "https://www.figma.com/api/mcp/asset/317a54a5-1ee5-4f1b-b372-d97dbaf63977")
    private let avatarBgURL = URL(string: "https://www.figma.com/api/mcp/asset/11d4d563-6fc3-4156-9f71-1b448688a723")

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            titulo
            tarjetaInterna
        }
        .padding(.horizontal, 9)
        .padding(.vertical, 10)
        .background(Color(figmaHex: "#F7FAFD"))
        .overlay(
            RoundedRectangle(cornerRadius: 13)
                .stroke(Color(figmaHex: "#027AFF"), lineWidth: 2)
        )
        .clipShape(RoundedRectangle(cornerRadius: 13))
        .shadow(color: Color(red: 0, green: 62 / 255, blue: 132 / 255).opacity(0.30), radius: 1, y: 1)
        .shadow(color: Color(figmaHex: "#027AFF").opacity(0.25), radius: 3, y: 0)
        .frame(width: 293, height: 200)
    }

    private var titulo: some View {
        HStack(spacing: 4) {
            VStack(alignment: .leading, spacing: 2) {
                Text("Perfil fiscal")
                    .font(.system(size: 13, weight: .semibold))
                    .tracking(-0.13)
                    .foregroundStyle(Color(figmaHex: "#343A40"))

                Text("IAM-FISCAL-xxxxxxxxxx.com.blog")
                    .font(.system(size: 11, weight: .medium))
                    .tracking(-0.11)
                    .foregroundStyle(Color(figmaHex: "#9B9B9B"))
            }

            Spacer()

            ZStack {
                RoundedRectangle(cornerRadius: 19)
                    .fill(Color(figmaHex: "#007AFF"))
                    .frame(width: 39, height: 24)

                Image(systemName: "scalemass")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.white)
            }

            Image(systemName: "ellipsis")
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(Color(figmaHex: "#495057"))
                .rotationEffect(.degrees(90))
                .frame(width: 16, height: 16)
        }
    }

    private var tarjetaInterna: some View {
        HStack(spacing: 16) {
            bloquePerfil

            Rectangle()
                .fill(Color(figmaHex: "#F7FAFD"))
                .frame(width: 1, height: 105)

            qrContainer
        }
        .padding(12)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 9))
    }

    private var bloquePerfil: some View {
        VStack(spacing: 10) {
            ZStack {
                Group {
                    if let avatarBgURL {
                        AsyncImage(url: avatarBgURL) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            Circle().fill(Color(figmaHex: "#E6E8EB"))
                        }
                    } else {
                        Circle().fill(Color(figmaHex: "#E6E8EB"))
                    }
                }
                .frame(width: 43, height: 43)
                .clipShape(Circle())

                Text("JF")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(Color(figmaHex: "#495057").opacity(0.5))
            }

            VStack(spacing: 2) {
                Text("Razón social")
                    .font(.system(size: 12, weight: .medium))
                    .tracking(-0.12)
                    .foregroundStyle(Color(figmaHex: "#020202"))

                Text("RFC1234567890")
                    .font(.system(size: 11, weight: .medium))
                    .tracking(-0.11)
                    .foregroundStyle(Color(figmaHex: "#020202"))

                Text("Perfil personal")
                    .font(.system(size: 10, weight: .medium))
                    .tracking(-0.3)
                    .foregroundStyle(Color(figmaHex: "#3D8A88"))
                    .padding(.horizontal, 16)
                    .frame(height: 16)
                    .background(Color(figmaHex: "#D8F4F3"))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .padding(.top, 1)
            }
            .multilineTextAlignment(.center)
        }
    }

    private var qrContainer: some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(Color(figmaHex: "#027AFF"), lineWidth: 1.5)
            .frame(width: 109, height: 110)
            .overlay {
                Group {
                    if let qrImageURL {
                        AsyncImage(url: qrImageURL) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color(figmaHex: "#E9F2FB")
                        }
                    } else {
                        Color(figmaHex: "#E9F2FB")
                    }
                }
                .frame(width: 101, height: 102)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
    }
}

#Preview {
    TarjetaPerfilFiscalView()
}
