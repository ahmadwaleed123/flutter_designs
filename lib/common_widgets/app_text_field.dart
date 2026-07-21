import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/theme_constants.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String errorText;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final int? minLines;
  final int maxLines;
  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final TextAlign textAlignment;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  final Function()? onTap;
  final List<String>? autofillHints;
  final bool readOnly;
  final bool obscureText;
  final FocusNode? focusNode;
  final TextInputAction? inputAction;

  const AppTextField({
    super.key,
    this.inputType = TextInputType.text,
    this.label,
    this.hintText,
    this.controller,
    this.errorText = '',
    this.minLines,
    this.maxLines = 1,
    this.contentPadding,
    this.borderRadius,
    this.textAlignment = TextAlign.start,
    this.inputFormatters,
    this.onTap,
    this.readOnly = false,
    this.obscureText = false,
    this.onChange,
    this.focusNode,
    this.onFieldSubmitted,
    this.inputAction,
    this.autofillHints,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autofillHints: autofillHints,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onTap: onTap,
          controller: controller,
          style: AppTextStyle.interW400(14),
          minLines: minLines,
          maxLines: maxLines,
          textAlign: textAlignment,
          inputFormatters: inputFormatters,
          keyboardType: inputType,
          readOnly: readOnly,
          obscureText: obscureText,
          onChanged: onChange,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          textInputAction: inputAction,
          textCapitalization:
              inputType == TextInputType.emailAddress
                  ? TextCapitalization.none
                  : TextCapitalization.sentences,
          decoration: AppInputDecoration.borderedDecoration(
            borderRadius: borderRadius,
            hintText: hintText,
            label: label,
            contentPadding: contentPadding,
            prefixIcon: prefixIcon,
            suffIcon: suffixIcon,
          ),
        ),
        Visibility(
          visible: errorText.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: Text(
              errorText,
              style: AppTextStyle.interW400(12, fontColor: AppColors.errorChip),
            ),
          ),
        ),
      ],
    );
  }
}
