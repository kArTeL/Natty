// swiftlint:disable all
// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
  internal typealias Font = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
  internal typealias Font = UIFont
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum Gotham {
    internal static let bold = FontConvertible(name: "Gotham-Bold", family: "Gotham", path: "Gotham-Bold.otf")
    internal static let all: [FontConvertible] = [bold]
  }
  internal enum Roboto {
    internal static let light = FontConvertible(name: "Roboto-Light", family: "Roboto", path: "roboto-light.ttf")
    internal static let medium = FontConvertible(name: "Roboto-Medium", family: "Roboto", path: "roboto-medium.ttf")
    internal static let all: [FontConvertible] = [light, medium]
  }
  internal enum SFProDisplay {
    internal static let black = FontConvertible(name: "SFProDisplay-Black", family: "SF Pro Display", path: "SF-Pro-Display-Black.otf")
    internal static let blackItalic = FontConvertible(name: "SFProDisplay-BlackItalic", family: "SF Pro Display", path: "SF-Pro-Display-BlackItalic.otf")
    internal static let bold = FontConvertible(name: "SFProDisplay-Bold", family: "SF Pro Display", path: "SF-Pro-Display-Bold.otf")
    internal static let boldItalic = FontConvertible(name: "SFProDisplay-BoldItalic", family: "SF Pro Display", path: "SF-Pro-Display-BoldItalic.otf")
    internal static let heavy = FontConvertible(name: "SFProDisplay-Heavy", family: "SF Pro Display", path: "SF-Pro-Display-Heavy.otf")
    internal static let heavyItalic = FontConvertible(name: "SFProDisplay-HeavyItalic", family: "SF Pro Display", path: "SF-Pro-Display-HeavyItalic.otf")
    internal static let italic = FontConvertible(name: "SFProDisplay-Italic", family: "SF Pro Display", path: "SF-Pro-Display-RegularItalic.otf")
    internal static let light = FontConvertible(name: "SFProDisplay-Light", family: "SF Pro Display", path: "SF-Pro-Display-Light.otf")
    internal static let lightItalic = FontConvertible(name: "SFProDisplay-LightItalic", family: "SF Pro Display", path: "SF-Pro-Display-LightItalic.otf")
    internal static let medium = FontConvertible(name: "SFProDisplay-Medium", family: "SF Pro Display", path: "SF-Pro-Display-Medium.otf")
    internal static let mediumItalic = FontConvertible(name: "SFProDisplay-MediumItalic", family: "SF Pro Display", path: "SF-Pro-Display-MediumItalic.otf")
    internal static let regular = FontConvertible(name: "SFProDisplay-Regular", family: "SF Pro Display", path: "SF-Pro-Display-Regular.otf")
    internal static let semibold = FontConvertible(name: "SFProDisplay-Semibold", family: "SF Pro Display", path: "SF-Pro-Display-Semibold.otf")
    internal static let semiboldItalic = FontConvertible(name: "SFProDisplay-SemiboldItalic", family: "SF Pro Display", path: "SF-Pro-Display-SemiboldItalic.otf")
    internal static let thin = FontConvertible(name: "SFProDisplay-Thin", family: "SF Pro Display", path: "SF-Pro-Display-Thin.otf")
    internal static let thinItalic = FontConvertible(name: "SFProDisplay-ThinItalic", family: "SF Pro Display", path: "SF-Pro-Display-ThinItalic.otf")
    internal static let ultralight = FontConvertible(name: "SFProDisplay-Ultralight", family: "SF Pro Display", path: "SF-Pro-Display-Ultralight.otf")
    internal static let ultralightItalic = FontConvertible(name: "SFProDisplay-UltralightItalic", family: "SF Pro Display", path: "SF-Pro-Display-UltralightItalic.otf")
    internal static let all: [FontConvertible] = [black, blackItalic, bold, boldItalic, heavy, heavyItalic, italic, light, lightItalic, medium, mediumItalic, regular, semibold, semiboldItalic, thin, thinItalic, ultralight, ultralightItalic]
  }
  internal static let allCustomFonts: [FontConvertible] = [Gotham.all, Roboto.all, SFProDisplay.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  internal func font(size: CGFloat) -> Font! {
    return Font(font: self, size: size)
  }

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    let bundle = Bundle(for: BundleToken.self)
    return bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension Font {
  convenience init!(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

private final class BundleToken {}
