import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_styles.dart';
import '../utils/colors_manager.dart';

class CustomAuthTextForm extends StatefulWidget {
  const CustomAuthTextForm({
    super.key,
    required this.controller,
    required this.textFormFieldHeader,
    this.validator,
    this.prefixIcon,
    // this.suffixIcon,
    this.hintText,
    this.isPassword = false,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  // final Widget? suffixIcon;
  final String? hintText;
  final String textFormFieldHeader;
  final bool isPassword;
  final TextInputType? keyboardType;

  @override
  State<CustomAuthTextForm> createState() => _CustomAuthTextFormState();
}

class _CustomAuthTextFormState extends State<CustomAuthTextForm> {
  bool _isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' ${widget.textFormFieldHeader}',
          style: LightAppStyle.textFormFieldHeader,
        ),
        8.verticalSpace,
        // DecoratedBox(
        //   decoration: BoxDecoration(boxShadow: [
        //     BoxShadow(
        //       color: Colors.blue,
        //       blurRadius: 5.0.r,
        //       spreadRadius: 0,
        //       offset: const Offset(0, 4),
        //     ),
        //   ]),
        Material(
          elevation: 8.0.r,
          shadowColor: Colors.blue,
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12.0.r),
          child: TextFormField(
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            controller: widget.controller,
            obscureText: widget.isPassword && _isObscureText,
            style: LightAppStyle.textFormStyle,
            decoration: InputDecoration(
              // border: InputBorder.none,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0.r),
                borderSide: const BorderSide(
                  color: ColorsManager.blue,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0.r),
                borderSide: const BorderSide(color: Colors.red),
              ),
              hintText: widget.hintText,
              hintStyle: LightAppStyle.textFieldHint,
              filled: true,
              fillColor: Colors.grey.shade300,
              prefixIcon: widget.isPassword ? null : widget.prefixIcon,
              suffixIcon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: widget.isPassword
                    ? IconButton(
                        key: ValueKey<bool>(_isObscureText),
                        onPressed: () {
                          setState(() {
                            _isObscureText = !_isObscureText;
                          });
                        },
                        icon: Icon(
                          _isObscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
