import 'package:flutter/material.dart';

import '../core/config/app_theme.dart';

class AppTextField extends StatefulWidget {
  final bool hideBorder;
  final AppColors theme;
  final String title;
  final bool onlyRead;
  final TextEditingController controller;
  final int? minLines;
  final bool autofocus;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final void Function(String text)? onChanged;
  final void Function()? onTap;
  final double radius;
  final Color fillColor;
  final bool useBorder;

  const AppTextField({
    this.hideBorder = false,
    super.key,
    this.fillColor = Colors.transparent,
    this.radius = 14,
    required this.title,
    required this.controller,
    this.minLines,
    this.suffixIcon,
    this.maxLines,
    this.onChanged,
    this.useBorder = true,
    this.onlyRead = false,
    this.prefixIcon,
    this.onTap,
    this.textInputType,
    required this.theme,
    this.autofocus = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: widget.autofocus,
      keyboardType: widget.textInputType,
      readOnly: widget.onlyRead,
      onTap: () {
        if (widget.onTap != null) widget.onTap!();
      },
      onChanged: (str) {
        if (widget.onChanged != null) widget.onChanged!(str);
      },
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      controller: widget.controller,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: widget.theme.textColor,
      ),
      cursorColor: widget.theme.mainColor,
      decoration: InputDecoration(
        hintText: widget.title,
        hintStyle: TextStyle(
          color: widget.theme.secondaryTextColor.withOpacity(0.8),
          fontWeight: FontWeight.w400,
          fontSize: 13,
        ),
        filled: true,
        fillColor: widget.fillColor,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: !widget.useBorder ? Colors.transparent : widget.theme.mainColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: !widget.useBorder ? Colors.transparent : widget.theme.mainColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: !widget.useBorder ? Colors.transparent : Colors.grey,
          ),
        ),
        // border: InputBorder.none,
        border: widget.hideBorder
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  color: !widget.useBorder ? Colors.transparent : Colors.grey,
                ),
              ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        suffixIcon: !widget.onlyRead
            ? widget.suffixIcon
            : widget.controller.text.isEmpty
                ? Icon(
                    Icons.expand_circle_down_outlined,
                    color: widget.theme.textColor,
                  )
                : Icon(
                    Icons.done,
                    color: widget.theme.mainColor,
                    size: 20,
                  ),
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
