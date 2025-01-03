part of "../cores.dart";

abstract class Assets {
  // Images
  static final images = _Images();
  static final imagesPNG = _ImagesPNG();
  static final imagesSVG = _ImagesSVG();

  // Icons
  static final iconsPNG = _IconsPNG();
  static final iconsSVG = _IconsSVG();
}

class _Images {
  static const baseJpg = "lib/src/assets/images/jpg";
  final anniversary13th = "$baseJpg/anniversary_13th.jpg";
  final biryaniBowl = "$baseJpg/biryani_bowl.jpg";
  final biryaniMahalBanner = "$baseJpg/biryani_mahal_banner.jpg";
  final biryaniMahalLogo = "$baseJpg/biryani_mahal_logo.jpg";
  final biryaniMahalShop = "$baseJpg/biryani_mahal_shop.jpg";
  final chickenKebab = "$baseJpg/chicken_kebab.jpg";
  final kebabPlatter = "$baseJpg/kebab_platter.jpg";
  final seekhKebab = "$baseJpg/seekh_kebab.jpg";
  final specialPlatter = "$baseJpg/special_platter.jpg";
  final tandooriWithKebab = "$baseJpg/tandoori_with_kebab.jpg";
}

class _ImagesPNG {
  static const basePng = "lib/src/assets/images/png";
}

class _ImagesSVG {
  static const baseSvg = "lib/src/assets/images/svg";
}

class _IconsPNG {
  static const basePng = "lib/src/assets/icons/png";
}

class _IconsSVG {
  static const baseSvg = "lib/src/assets/icons/svg";
}