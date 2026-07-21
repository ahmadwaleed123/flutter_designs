import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary Black
  static const Color primaryBlack = Color(0xff1A1B25);
  static const Color secondaryBlack = Color(0xff5C5F70);
  static const Color tertiaryBlack = Color(0xff9A9CB0);
  static const Color quaternaryBlack = Color(0xffE4E5EC);

  // Primary White
  static const Color primaryWhite = Color(0xffffffff);
  static const Color secondaryWhite = Color(0xffD6D8E4);
  static const Color tertiaryWhite = Color(0xffA7A9BC);
  static const Color quaternaryWhite = Color(0xff7A7C93);

  // Primary Brand
  static const Color primaryBrand = Color(0xff4F46E5);
  static const Color secondaryBrand = Color(0xff7C74EF);
  static const Color tertiaryBrand = Color(0xffC7C2F9);
  static const Color quaternaryBrand = Color(0xffEEEDFC);

  // Primary Background
  static const Color primaryBackground = Color(0xffF6F6FB);
  static const Color secondaryBackground = Color(0xffEEEEF6);
  static const Color tertiaryBackground = Color(0xffDCDCE8);
  static const Color disabledColor = Color(0xffCBCACE);

  // Stroke Colors
  static const Color lightStroke = Color(0xffF5F5FA);
  static const Color mediumStroke = Color(0xffEDEDF5);
  static const Color darkStroke = Color(0xffE0E0EC);

  // Chip Colors
  static const Color errorChip = Color(0xffFF4757);
  static const Color successChip = Color(0xff2ED573);
  static const Color informationChip = Color(0xff4FA1FF);
  static const Color warningChip = Color(0xffFFB020);

  // Chip Background Colors
  static const Color errorChipBg = Color(0xffFFE3E5);
  static const Color successChipBg = Color(0xffDCFCE9);
  static const Color informationChipBg = Color(0xffDFEEFF);
  static const Color warningChipBg = Color(0xffFFF3DC);

  // Screen Background
  static const Color screenBg = Color(0xffF8F8FC);

  // Card gradient accents (payment cards)
  static const Color cardIndigoStart = Color(0xff5B4FE9);
  static const Color cardIndigoEnd = Color(0xff2E27A8);
  static const Color cardSlateStart = Color(0xff2D3142);
  static const Color cardSlateEnd = Color(0xff11131C);
}

class AppTextStyle {
  static interW400(
    double fontSize, {
    Color fontColor = AppColors.primaryBlack,
    double? height,
    TextDecoration? textDecoration,
  }) => _inter(
    fontSize,
    fontColor: fontColor,
    height: height,
    fontWeight: FontWeight.w400,
    textDecoration: textDecoration,
  );

  static interW600(
    double fontSize, {
    Color fontColor = AppColors.primaryBlack,
    double? height,
    TextDecoration? textDecoration,
  }) => _inter(
    fontSize,
    fontColor: fontColor,
    height: height,
    fontWeight: FontWeight.w600,
    textDecoration: textDecoration,
  );

  static _inter(
    double fontSize, {
    Color fontColor = AppColors.primaryBlack,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
  }) => GoogleFonts.inter(
    color: fontColor,
    fontSize: fontSize.sp,
    height: height ?? 1.5,
    fontWeight: fontWeight,
    decoration: textDecoration,
  );

  static poppinsW600(
    double fontSize, {
    Color fontColor = AppColors.primaryBlack,
    double? height,
    TextDecoration? textDecoration,
  }) => _poppins(
    fontSize,
    fontColor: fontColor,
    height: height,
    fontWeight: FontWeight.w600,
    textDecoration: textDecoration,
  );

  static poppinsW700(
    double fontSize, {
    Color fontColor = AppColors.primaryBlack,
    double? height,
    TextDecoration? textDecoration,
  }) => _poppins(
    fontSize,
    fontColor: fontColor,
    height: height,
    fontWeight: FontWeight.w700,
    textDecoration: textDecoration,
  );

  static _poppins(
    double fontSize, {
    Color fontColor = AppColors.primaryBlack,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
  }) => GoogleFonts.poppins(
    color: fontColor,
    fontSize: fontSize.sp,
    height: height ?? 1.4,
    fontWeight: fontWeight,
    decoration: textDecoration,
  );
}

class AppSpacing {
  static EdgeInsets leftRightSpacing({double space = 20}) =>
      EdgeInsets.symmetric(horizontal: space.spMin, vertical: 0);

  static EdgeInsets get leftRightSpacingLarge =>
      EdgeInsets.symmetric(horizontal: 20.spMin, vertical: 20.spMin);

  static EdgeInsets get leftRightSpacingSmall =>
      EdgeInsets.symmetric(horizontal: 20.spMin);

  static EdgeInsets get pageSpacingSmall =>
      EdgeInsets.symmetric(horizontal: 20.spMin, vertical: 20.spMin);

  static get vertical8pxSpacing => SizedBox(height: 8.spMin);

  static get vertical15pxSpacing => SizedBox(height: 15.spMin);

  static get vertical20pxSpacing => SizedBox(height: 20.spMin);

  static get horizontal15pxSpacing => SizedBox(width: 15.spMin);

  static get horizontal20pxSpacing => SizedBox(width: 20.spMin);

  static verticalXSpacing({double space = 10}) => SizedBox(height: space.spMin);

  static horizontalXSpacing({double space = 10}) =>
      SizedBox(width: space.spMin);
}

class AppInputDecoration {
  static InputDecoration borderedDecoration({
    String? hintText,
    String? label,
    double? borderRadius,
    double? hintFontSize,
    EdgeInsetsGeometry? contentPadding,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffIcon,
    Color? fillColor,
    Color? hintColor,
  }) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRoundBorder.circularXpx(pixel: borderRadius ?? 12),
        borderSide: BorderSide(color: AppColors.primaryBrand, width: 1.spMin),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRoundBorder.circularXpx(pixel: borderRadius ?? 12),
        borderSide: BorderSide(color: AppColors.mediumStroke, width: 1.spMin),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRoundBorder.circularXpx(pixel: borderRadius ?? 12),
        borderSide: BorderSide(color: AppColors.errorChip, width: 1.spMin),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AppRoundBorder.circularXpx(pixel: borderRadius ?? 12),
        borderSide: BorderSide(color: AppColors.errorChip, width: 1.spMin),
      ),
      fillColor: fillColor,
      hintMaxLines: 1,
      labelStyle: AppTextStyle.interW400(12, fontColor: AppColors.tertiaryBlack),
      labelText: label,
      filled: fillColor != null,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefixIcon: prefixIcon ?? SizedBox(width: 15.spMin, height: 0),
      suffixIcon: suffIcon ?? const SizedBox(height: 0, width: 0),
      prefixIconConstraints: BoxConstraints(minWidth: 10.spMin, minHeight: 0),
      suffixIconConstraints: BoxConstraints(minWidth: 15.spMin, minHeight: 0),
      errorText: errorText,
      hintText: hintText,
      hintStyle: AppTextStyle.interW400(
        hintFontSize ?? 16,
        fontColor: hintColor ?? AppColors.tertiaryBlack,
      ),
      counterText: '',
      contentPadding:
          contentPadding ??
          EdgeInsets.symmetric(horizontal: 20.spMin, vertical: 15.spMin),
    );
  }
}

class AppRoundBorder {
  static BorderRadius get circular10px => BorderRadius.circular(10);

  static BorderRadius circularTop({double pixel = 10}) => BorderRadius.only(
    topLeft: Radius.circular(pixel),
    topRight: Radius.circular(pixel),
  );

  static BorderRadius get circular15px => BorderRadius.circular(15);

  static BorderRadius get bottom10pxBorder => const BorderRadius.only(
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
  );

  static BorderRadius circularXpx({double pixel = 12}) =>
      BorderRadius.circular(pixel);
}

class ToastMessage {
  static successMessage(String message) => Fluttertoast.showToast(
    msg: message,
    backgroundColor: AppColors.successChip,
  );

  static errorMessage(String error) =>
      Fluttertoast.showToast(msg: error, backgroundColor: AppColors.errorChip);
}
