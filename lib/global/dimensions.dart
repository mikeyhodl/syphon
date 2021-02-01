// decoration: BoxDecoration( // DEBUG ONLY
//   color: Colors.red,
// ),

// Flutter imports:
import 'package:flutter/material.dart';

class Dimensions {
  // Generic
  static const double widgetHeightMax = 1024;
  static const scrollviewPadding = EdgeInsets.only(bottom: 32);

  static const appPaddingVertical = EdgeInsets.symmetric(
    vertical: 16,
  );

  static const appPaddingHorizontal = EdgeInsets.symmetric(
    horizontal: 16,
  );

  // Avatars
  static const double avatarSize = 56; // was 52
  static const double avatarSizeMin = 48;
  static const double avatarSizeMax = 350; // Change to HeroSize
  static const double avatarSizeLarge = 84;
  static const double avatarSizeMessage = 28;
  static const double avatarSizeDetails = 120;
  static double avatarFontSize({double size = 32}) => (size / 2.22);

  static const double listAvatarHeighttMax = 72;

  // Media
  static const double mediaSize = 264;
  static const double mediaSizeMin = 208;
  static const double mediaSizeMax = 320;

  static const double thumbnailSizeMin = 48;
  static const double thumbnailSizeMax = 48;

  // Buttons
  static const double buttonHeightMin = 56;
  static const double buttonWidthMin = 96;
  static const double buttonWidthMax = 296;
  static const double buttonAppBarSize = 26;
  static const double buttonSendSize = 48;

  // Messages
  static const double bubbleHeightMin = 54;
  static const double bubbleWidthMin = 122;

  // Icons
  static const double iconSize = 26;
  static const double iconSizeMini = 12;
  static const double iconSizeLite = 24;
  static const double iconSizeLarge = 32;
  static const double indicatorSize = 14;

  // Badges
  static const double badgeAvatarSize = 16;
  static const double badgeAvatarSizeSmall = 12;

  // Progress
  static const double progressIndicatorSize = 26;
  static const double progressIndicatorSizeLite = 12;

  // Text
  static const double textSizeTiny = 12;
  static const double textInitialSize = 18;

  // Inputs
  static const double inputSizeMin = 200;
  static const double inputSizeMax = 296;

  static const double inputHeight = 52;
  static const double inputEditorHeight = 96;
  static const double inputBorderRadius = 30.0;
  static const double inputWidthMin = inputSizeMin;
  static const double inputWidthMax = inputSizeMax; // 43 * 8

  static const EdgeInsets inputContentPadding = const EdgeInsets.symmetric(
    vertical: 4.0,
    horizontal: 20.0,
  );

  static const EdgeInsets inputMargin = EdgeInsets.all(8);

  static const EdgeInsets inputPadding = EdgeInsets.only(
    left: 20,
    bottom: 32,
  );

  // Lists
  static const heroPadding = EdgeInsets.symmetric(
    vertical: 24,
    horizontal: 12,
  );

  static const listPadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 8,
  );

  static const listPaddingSettings = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 4,
  );

  static listPaddingDynamic({width = 500}) => EdgeInsets.only(
        left: width * 0.04,
        right: width * 0.04,
        top: 4,
        bottom: 8,
      );

  static listTitlePaddingDynamic({width = 500}) => EdgeInsets.only(
        left: width * 0.04,
        right: width * 0.04,
        top: 6,
        bottom: 14,
      );

  // Dialogs
  static const EdgeInsets dialogPadding = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 16,
  );

  static const EdgeInsets dialogContentPadding = EdgeInsets.symmetric(
    horizontal: 8,
    vertical: 12,
  );

  // Content
  static contentWidth(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width * 0.75;
  }

  static contentWidthWide(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width * 0.8;
  }

  static const contentPadding = EdgeInsets.symmetric(
    horizontal: 32,
    vertical: 8,
  );

  static contentPaddingDynamic({width = 500}) {
    return EdgeInsets.symmetric(
      horizontal: width * 0.04,
      vertical: 4,
    );
  }

  // Page Viewer
  static const double pageViewerWidthMin = 326;
  static const double pageViewerHeightMin = 326;
  static const double pageViewerHeightMax = widgetHeightMax / 2;

  // Progress Indicator
  static const double defaultStrokeWidth = 2;
  static const double defaultStrokeWidthLite = 1.5;

  // Modals
  static const double defaultModalHeight = 256;
  static const double defaultModalHeightMax = 456;
  static modalHeightDefault(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.height * 0.4;
  }

  // Action Rin
  static actionRingDefaultWidth(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width < 400 ? size.width : size.width * 0.9;
  }

  // * Device Specific *
  static const buttonlessHeightiOS = 736;
}
