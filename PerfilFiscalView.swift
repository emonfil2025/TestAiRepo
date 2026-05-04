import SwiftUI

struct PerfilFiscalView: View {
    @State private var nombre = ""
    @State private var rfc = ""
    @State private var razonSocial = ""
    @State private var codigoPostal = ""

    @State private var tipoPersona = "Fisica"
    @State private var regimenFiscal = ""
    @State private var usoCFDI = ""

    @State private var mostrarTipoPersonaMenu = true

    var body: some View {
        ZStack {
            Color(.systemGray6).ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 12) {
                    encabezado
                    cajaInfo

                    VStack(spacing: 7) {
                        dropdownTipoPersona
                        campoTexto(titulo: "Nombre", texto: $nombre)
                        campoTexto(titulo: "RFC", texto: $rfc)
                        campoDropdown(titulo: "Regimen Fiscal", valor: regimenFiscal)
                        campoTexto(titulo: "Razón social", texto: $razonSocial)
                        campoDropdown(titulo: "Uso de CFDI", valor: usoCFDI)
                        campoTexto(titulo: "Código postal", texto: $codigoPostal)
                    }

                    botonCrear
                }
                .padding(12)
            }
        }
    }

    private var encabezado: some View {
        HStack(spacing: 4) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(figmaHex: "#007AFF"))
                    .frame(width: 41, height: 28)
                Image(systemName: "scalemass")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.white)
            }

            Text("Crea tu perfil fiscal")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color(figmaHex: "#343A40"))

            Spacer()
        }
    }

    private var cajaInfo: some View {
        HStack(alignment: .top, spacing: 6) {
            Image(systemName: "info.circle")
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(Color(figmaHex: "#ADB5BD"))
                .frame(width: 14, height: 14)

            Rectangle()
                .fill(Color(figmaHex: "#ADB5BD"))
                .frame(width: 1)

            Text("Genera tu perfil con RFC y datos fiscales completos para poder facturar sin complicaciones. Guarda tu información de forma segura, reutilízala cuando la necesites y emite facturas de manera rápida, todo desde una sola herramienta pensada para simplificar tus procesos fiscales.")
                .font(.system(size: 11, weight: .regular))
                .foregroundStyle(Color(figmaHex: "#ADB5BD"))
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, minHeight: 81, alignment: .leading)
        .background(Color(figmaHex: "#F3F4F5"))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    private var dropdownTipoPersona: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Tipo de persona")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.black)

                Button {
                    withAnimation(.easeInOut(duration: 0.18)) {
                        mostrarTipoPersonaMenu.toggle()
                    }
                } label: {
                    HStack {
                        Text(tipoPersona)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .font(.system(size: 12, weight: .semibold))
                            .rotationEffect(.degrees(mostrarTipoPersonaMenu ? 180 : 0))
                            .foregroundStyle(Color(figmaHex: "#1E6091"))
                    }
                    .padding(.horizontal, 12)
                    .frame(height: 34)
                    .background(Color(figmaHex: "#EDF4FC"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 9)
                            .stroke(Color(figmaHex: "#007AFF"), lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 9))
                }
                .buttonStyle(.plain)
            }

            if mostrarTipoPersonaMenu {
                VStack(spacing: 0) {
                    opcionPersona("Fisica")
                    Divider().overlay(Color.black.opacity(0.2))
                    opcionPersona("Moral", fondo: Color(figmaHex: "#C9D0D9"))
                }
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: .black.opacity(0.2), radius: 8, y: 2)
                .padding(.top, 2)
            }
        }
    }

    private func opcionPersona(_ titulo: String, fondo: Color = .white) -> some View {
        Button {
            tipoPersona = titulo
            withAnimation(.easeInOut(duration: 0.18)) {
                mostrarTipoPersonaMenu = false
            }
        } label: {
            HStack {
                Text(titulo)
                    .font(.system(size: 31.0 / 2.0, weight: .regular))
                    .foregroundStyle(.black)
                Spacer()
            }
            .padding(.horizontal, 16)
            .frame(height: 44)
            .background(fondo)
        }
        .buttonStyle(.plain)
    }

    private func campoTexto(titulo: String, texto: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(titulo)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.black)

            TextField("", text: texto)
                .textFieldStyle(.plain)
                .padding(.horizontal, 12)
                .frame(height: 34)
                .background(Color(figmaHex: "#EFF3F7"))
                .overlay(
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color(red: 48 / 255, green: 96 / 255, blue: 149 / 255).opacity(0.21), lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 9))
        }
    }

    private func campoDropdown(titulo: String, valor: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(titulo)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.black)

            HStack {
                Text(valor)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.black.opacity(0.55))
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(Color(figmaHex: "#1E6091"))
            }
            .padding(.horizontal, 12)
            .frame(height: 34)
            .background(Color(figmaHex: "#EFF3F7"))
            .overlay(
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color(red: 48 / 255, green: 96 / 255, blue: 149 / 255).opacity(0.21), lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 9))
        }
    }

    private var botonCrear: some View {
        Button {} label: {
            Text("Crear perfil fiscal")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(Color(figmaHex: "#F8F9FA"))
                .tracking(-0.14)
                .frame(maxWidth: .infinity)
                .frame(height: 42)
                .background(Color(figmaHex: "#027AFF"))
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
        .padding(.top, 8)
    }
}

#Preview {
    PerfilFiscalView()
}
