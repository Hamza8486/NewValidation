
import 'package:flutter/material.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';



class AppTextField extends StatefulWidget {
  AppTextField({
    Key? key,
    this.hint = "",
    this.hintColor,
    this.hintSize,
    this.textInputType,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.isShowCursor = true,
    this.isReadOnly = false,
    this.maxLines,
    this.isVisible = true,
    this.enabled = true,
    this.onChange,
    this.onEditingComplete,
    this.cursorColor,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.isborderline = false,
    this.borderColor = Colors.orange,
    this.borderRadius = BorderRadius.zero,
    /* this.intialValue = "",*/
    this.onTap,
    this.obsecure = false,
    this.controller,
    this.fillColor = Colors.white,
    this.isFill = false,
    this.fontFamily = "regular",
    this.maxLength,
    this.onSuffixTap,
    this.autovalidateMode,
    this.isPrefix = false,
    this.isSuffix = false,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);
  final bool obsecure;
  final String hint;
  final bool isFill;
  final bool isVisible;
  final bool enabled;
  final String fontFamily;
  String? Function(String?)? validator;
  Function(String?)? onChange;
  final Color? hintColor;
  final double? hintSize;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final bool isShowCursor;
  final AutovalidateMode? autovalidateMode;
  final bool isReadOnly;
  final bool isPrefix;
  final bool isSuffix;
  final EdgeInsets padding;
  final int? maxLines;
  final int? maxLength;
  final Color borderColor;
  final Color? cursorColor;
  void Function()? onEditingComplete;
  void Function(String)? onFieldSubmitted;
  void Function(String?)? onSaved;
  final bool isborderline;
  final BorderRadius borderRadius;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  /*final String intialValue;*/
  final VoidCallback? onTap;
  final VoidCallback? onSuffixTap;
  final Color fillColor;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isClear = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      autovalidateMode: widget.autovalidateMode,

      onChanged: widget.onChange ??
          (value) {
            if (value.isNotEmpty) {
              setState(() {
                isClear = true;
              });
            } else {
              setState(() {
                isClear = false;
              });
            }
          },
      onEditingComplete: widget.onEditingComplete,
      onSaved: widget.onSaved,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      controller: widget.controller,
      style: TextStyle(fontFamily: Weights.medium, fontSize: AppSizes.SIZE_13),
      maxLength: widget.maxLength,
      obscureText: this.widget.obsecure,
      onTap: widget.onTap,
      cursorColor: widget.cursorColor ?? AppColor.primaryColor,
      /* initialValue: intialValue,*/
      maxLines: widget.maxLines,
      // maxLengthEnforced: false,
      showCursor: widget.isShowCursor,
      readOnly: widget.isReadOnly,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      inputFormatters: [],

      decoration: InputDecoration(
        contentPadding: widget.padding,

        fillColor: widget.fillColor,
        filled: widget.isFill,


        hintText: widget.hint,
        suffixIcon: widget.isSuffix ? this.widget.suffixIcon : null,
        prefixIcon: widget.isPrefix ? this.widget.prefixIcon : null,
        hintStyle: TextStyle(
          color: widget.hintColor,
          fontSize: widget.hintSize,
          fontFamily: widget.fontFamily,
        ),
        border: widget.isborderline
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor,
                ),
                borderRadius: widget.borderRadius,
              )
            : null,
        enabledBorder: widget.isborderline
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor,
                ),
                borderRadius: widget.borderRadius,
              )
            : null,
        disabledBorder: widget.isborderline
            ? OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: widget.borderColor),
                borderRadius: widget.borderRadius,
              )
            : null,
        errorBorder: widget.isborderline
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor,
                ),
                borderRadius: widget.borderRadius,
              )
            : null,
        focusedBorder: widget.isborderline
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor,
                ),
                borderRadius: widget.borderRadius,
              )
            : null,
        focusedErrorBorder: widget.isborderline
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor,
                ),
                borderRadius: widget.borderRadius,
              )
            : null,
      ),
    );
  }
}
