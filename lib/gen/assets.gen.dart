/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Sora-Bold.ttf
  String get soraBold => 'assets/fonts/Sora-Bold.ttf';

  /// File path: assets/fonts/Sora-ExtraBold.ttf
  String get soraExtraBold => 'assets/fonts/Sora-ExtraBold.ttf';

  /// File path: assets/fonts/Sora-ExtraLight.ttf
  String get soraExtraLight => 'assets/fonts/Sora-ExtraLight.ttf';

  /// File path: assets/fonts/Sora-Light.ttf
  String get soraLight => 'assets/fonts/Sora-Light.ttf';

  /// File path: assets/fonts/Sora-Medium.ttf
  String get soraMedium => 'assets/fonts/Sora-Medium.ttf';

  /// File path: assets/fonts/Sora-Regular.ttf
  String get soraRegular => 'assets/fonts/Sora-Regular.ttf';

  /// File path: assets/fonts/Sora-SemiBold.ttf
  String get soraSemiBold => 'assets/fonts/Sora-SemiBold.ttf';

  /// File path: assets/fonts/Sora-Thin.ttf
  String get soraThin => 'assets/fonts/Sora-Thin.ttf';

  /// List of all assets
  List<String> get values => [
        soraBold,
        soraExtraBold,
        soraExtraLight,
        soraLight,
        soraMedium,
        soraRegular,
        soraSemiBold,
        soraThin
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/chevron-right.svg
  String get chevronRight => 'assets/icons/chevron-right.svg';

  /// File path: assets/icons/lock-03.svg
  String get lock03 => 'assets/icons/lock-03.svg';

  /// File path: assets/icons/mail-01.svg
  String get mail01 => 'assets/icons/mail-01.svg';

  /// File path: assets/icons/warning.svg
  String get warning => 'assets/icons/warning.svg';

  /// File path: assets/icons/x-close-border.svg
  String get xCloseBorder => 'assets/icons/x-close-border.svg';

  /// List of all assets
  List<String> get values =>
      [chevronRight, lock03, mail01, warning, xCloseBorder];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_android_icon.png
  AssetGenImage get appAndroidIcon =>
      const AssetGenImage('assets/images/app_android_icon.png');

  /// File path: assets/images/app_icon.png
  AssetGenImage get appIcon =>
      const AssetGenImage('assets/images/app_icon.png');

  /// File path: assets/images/app_ios_icon.png
  AssetGenImage get appIosIcon =>
      const AssetGenImage('assets/images/app_ios_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [appAndroidIcon, appIcon, appIosIcon];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/bookreveal.json
  String get bookreveal => 'assets/json/bookreveal.json';

  /// List of all assets
  List<String> get values => [bookreveal];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
