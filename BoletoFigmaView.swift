import SwiftUI

struct BoletoFigmaView: View {
    private let fondoTicketURL = URL(string: "https://www.figma.com/api/mcp/asset/58d3e241-57eb-4490-b26e-405c72b9afef")
    private let headerImageURL = URL(string: "https://www.figma.com/api/mcp/asset/9b931b15-38b2-410c-b95a-9cf873b0784e")
    private let iconoRestauranteURL = URL(string: "https://www.figma.com/api/mcp/asset/8fc21800-0180-42e5-84b2-4367739b26c0")

    var body: some View {
        ZStack {
            ticketBackground

            VStack(spacing: 8) {
                header
                    .padding(.top, 10)
                    .padding(.horizontal, 9)

                perforaciones
                    .padding(.horizontal, 16)

                contenido
                    .padding(.horizontal, 9)
                    .padding(.bottom, 8)
            }
        }
        .frame(width: 318, height: 330)
    }

    private var ticketBackground: some View {
        Group {
            if let fondoTicketURL {
                AsyncImage(url: fondoTicketURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(figmaHex: "#E5E7EA"))
                }
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(figmaHex: "#E5E7EA"))
            }
        }
        .frame(width: 318, height: 330)
        .clipped()
    }

    private var header: some View {
        ZStack(alignment: .leading) {
            Group {
                if let headerImageURL {
                    AsyncImage(url: headerImageURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color(figmaHex: "#9098A1")
                    }
                } else {
                    Color(figmaHex: "#9098A1")
                }
            }
            .frame(height: 104)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay {
                LinearGradient(
                    colors: [
                        Color(figmaHex: "#22252E").opacity(0.9),
                        Color(figmaHex: "#22252E").opacity(0.0)
                    ],
                    startPoint: .bottom,
                    endPoint: .top
                )
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            HStack(spacing: 8) {
                Group {
                    if let iconoRestauranteURL {
                        AsyncImage(url: iconoRestauranteURL) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            Color(figmaHex: "#5E6975")
                        }
                    } else {
                        Color(figmaHex: "#5E6975")
                    }
                }
                .frame(width: 36.3, height: 24)
                .clipShape(Capsule())
                .overlay {
                    Capsule()
                        .stroke(Color(figmaHex: "#DEE2E6"), lineWidth: 1)
                }

                Text("Restaurante El Antojo")
                    .font(.system(size: 31.0 / 2.0, weight: .semibold))
                    .tracking(-0.16)
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.35), radius: 1, y: 1)

                Spacer()
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
        }
        .frame(height: 104)
    }

    private var perforaciones: some View {
        HStack(spacing: 4) {
            ForEach(0..<16, id: \.self) { _ in
                Circle()
                    .fill(Color.white.opacity(0.6))
                    .frame(width: 12, height: 12)
                    .overlay {
                        Circle()
                            .stroke(Color(figmaHex: "#C4C9CF"), lineWidth: 1)
                    }
            }
        }
    }

    private var contenido: some View {
        VStack(alignment: .leading, spacing: 8) {
            datoVertical(titulo: "FOLIO", valor: "123456789123", valorSize: 31.0 / 2.0)

            HStack(alignment: .top, spacing: 8) {
                datoVertical(titulo: "FECHA", valor: "03/01/2026 10:00hrs", valorSize: 13)
                    .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .leading, spacing: 2) {
                    Text("ESTATUS")
                        .font(.system(size: 11, weight: .semibold))
                        .tracking(0.66)
                        .foregroundStyle(Color(figmaHex: "#ADB5BD"))
                    HStack(spacing: 4) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 10))
                            .foregroundStyle(Color(figmaHex: "#00A882"))
                        Text("Pagado")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundStyle(Color(figmaHex: "#495057"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            VStack(alignment: .leading, spacing: 0) {
                Text("TOTAL (5 PRODUCTOS)")
                    .font(.system(size: 11, weight: .semibold))
                    .tracking(0.66)
                    .foregroundStyle(Color(figmaHex: "#ADB5BD"))

                HStack(spacing: 4) {
                    Text("$861.30")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(Color(figmaHex: "#2B333B"))
                    Text("MXN")
                        .font(.system(size: 11, weight: .medium))
                        .tracking(0.66)
                        .foregroundStyle(Color(figmaHex: "#ADB5BD"))
                        .padding(.top, 5)
                }
            }

            HStack(spacing: 8) {
                Button {} label: {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color(figmaHex: "#6A737D"))
                        .frame(width: 48, height: 36)
                        .background(Color(figmaHex: "#F0F2F4"))
                        .clipShape(Capsule())
                }
                .buttonStyle(.plain)

                Button {} label: {
                    HStack(spacing: 6) {
                        Image(systemName: "eye")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(Color(figmaHex: "#6A737D"))
                        Text("Ver detalle")
                            .font(.system(size: 14, weight: .medium))
                            .tracking(-0.14)
                            .foregroundStyle(Color(figmaHex: "#495057"))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 36)
                    .background(Color(figmaHex: "#F0F2F4"))
                    .clipShape(Capsule())
                }
                .buttonStyle(.plain)
            }
            .padding(.top, 2)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(figmaHex: "#FCFCFC"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }

    private func datoVertical(titulo: String, valor: String, valorSize: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(titulo)
                .font(.system(size: 11, weight: .semibold))
                .tracking(0.66)
                .foregroundStyle(Color(figmaHex: "#ADB5BD"))
            Text(valor)
                .font(.system(size: valorSize, weight: .regular))
                .foregroundStyle(Color(figmaHex: "#495057"))
        }
    }
}

#Preview {
    BoletoFigmaView()
}
