/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:lottie/lottie.dart' as _lottie;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

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
  SvgGenImage get chevronRight =>
      const SvgGenImage('assets/icons/chevron-right.svg');

  /// File path: assets/icons/lock-03.svg
  SvgGenImage get lock03 => const SvgGenImage('assets/icons/lock-03.svg');

  /// File path: assets/icons/mail-01.svg
  SvgGenImage get mail01 => const SvgGenImage('assets/icons/mail-01.svg');

  /// File path: assets/icons/warning.svg
  SvgGenImage get warning => const SvgGenImage('assets/icons/warning.svg');

  /// File path: assets/icons/x-close-border.svg
  SvgGenImage get xCloseBorder =>
      const SvgGenImage('assets/icons/x-close-border.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
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

  /// File path: assets/images/loading-forever.gif
  AssetGenImage get loadingForever =>
      const AssetGenImage('assets/images/loading-forever.gif');

  /// List of all assets
  List<AssetGenImage> get values =>
      [appAndroidIcon, appIcon, appIosIcon, loadingForever];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/bookreveal.json
  LottieGenImage get bookreveal =>
      const LottieGenImage('assets/json/bookreveal.json');

  /// File path: assets/json/emailsent.json
  LottieGenImage get emailsent =>
      const LottieGenImage('assets/json/emailsent.json');

  /// List of all assets
  List<LottieGenImage> get values => [bookreveal, emailsent];
}

class Assets {
  Assets._();

  static const String aEnv = '.env';
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();

  /// List of all assets
  static List<String> get values => [aEnv];
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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(
    this._assetName, {
    this.flavors = const {},
  });

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(
      BuildContext,
      Widget,
      _lottie.LottieComposition?,
    )? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
