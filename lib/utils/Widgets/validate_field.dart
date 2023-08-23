
import 'package:flutter/material.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';



class ValidateField extends StatefulWidget {
  ValidateField({
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
    this.isborderline1 = false,
    this.isborderline2 = false,
    this.borderColor = Colors.orange,
    this.borderColor1 = Colors.orange,
    this.borderColor2 = Colors.orange,
    this.borderRadius = BorderRadius.zero,
    this.borderRadius1 = BorderRadius.zero,
    this.borderRadius2 = BorderRadius.zero,
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
  final Color borderColor1;
  final Color borderColor2;
  final Color? cursorColor;
  void Function()? onEditingComplete;
  void Function(String)? onFieldSubmitted;
  void Function(String?)? onSaved;
  final bool isborderline;
  final bool isborderline1;
  final bool isborderline2;
  final BorderRadius borderRadius;
  final BorderRadius borderRadius1;
  final BorderRadius borderRadius2;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  /*final String intialValue;*/
  final VoidCallback? onTap;
  final VoidCallback? onSuffixTap;
  final Color fillColor;

  @override
  State<ValidateField> createState() => _ValidateFieldState();
}

class _ValidateFieldState extends State<ValidateField> {
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
      maxLines: widget.maxLines,
      showCursor: widget.isShowCursor,
      readOnly: widget.isReadOnly,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,

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

        enabledBorder: widget.isborderline
            ? OutlineInputBorder(
          borderSide: BorderSide( color: widget.borderColor,width: 1.5),

          borderRadius: widget.borderRadius,
        )
            : null,
        disabledBorder: widget.isborderline1
            ? OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: widget.borderColor1),
          borderRadius: widget.borderRadius1,
        )
            : null,
        errorBorder: widget.isborderline
            ? OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: widget.borderColor,
          ),
          borderRadius: widget.borderRadius,
        )
            : null,
        focusedErrorBorder: widget.isborderline2
            ? OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: widget.borderColor2,
          ),
          borderRadius: widget.borderRadius2,
        )
            : null,

        focusedBorder: widget.isborderline2
            ? OutlineInputBorder(
          borderRadius: widget.borderRadius2,

          borderSide: BorderSide(width: 1.5, color: widget.borderColor2),
        )
            : null,

      ),
    );
  }
}
