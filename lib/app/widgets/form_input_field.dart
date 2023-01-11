import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';
import 'package:icp_gahara_mobile/app/common/values/app_texts.dart';

class FormInputField extends StatelessWidget {
  const FormInputField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.controller,
    this.obscureText = false,
    this.onPasswordVisibilityChanged,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.done,
    this.prefixIcon,
    this.isRequired = false,
    this.keyboardType = TextInputType.text,
    this.textCapitalization,
    this.isTextArea = false,
    this.customValidation = false,
    this.customValidationFunction,
  });
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final Function(String)? onFieldSubmitted;
  final Icon? prefixIcon;

  final bool obscureText;
  final Function()? onPasswordVisibilityChanged;

  final bool? isRequired;
  final bool? isTextArea;
  final bool? customValidation;
  final Function(String?)? customValidationFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(labelText, style: AppTexts.primaryPRegular),
              const SizedBox(width: 2),
              Visibility(
                visible: isRequired!,
                child: const Text(
                  '*',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
            obscureText: obscureText,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            maxLines: isTextArea! ? 3 : 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (customValidation!) {
                return customValidationFunction!(value);
              }

              if (isRequired!) {
                if (value!.isEmpty) {
                  return 'Field ini tidak boleh kosong';
                }

                if (keyboardType == TextInputType.emailAddress) {
                  if (!GetUtils.isEmail(value)) {
                    return 'Email tidak valid';
                  }
                }

                if (keyboardType == TextInputType.url) {
                  if (!GetUtils.isURL(value)) {
                    return 'URL tidak valid';
                  }
                }

                if (keyboardType == TextInputType.datetime) {
                  if (!GetUtils.isDateTime(value)) {
                    return 'Tanggal tidak valid';
                  }
                }

                if (keyboardType == TextInputType.visiblePassword) {
                  if (!GetUtils.isLengthGreaterThan(value, 6)) {
                    return 'Password harus lebih dari 6 karakter';
                  }
                }

                if (keyboardType == TextInputType.text) {
                  if (!GetUtils.isLengthGreaterThan(value, 3)) {
                    return 'Karakter harus lebih dari 3';
                  }
                }
              }

              return null;
            },
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              hintText: hintText,
              fillColor: AppColors.secondaryColor,
              filled: true,
              suffixIcon: onPasswordVisibilityChanged != null
                  ? IconButton(
                      icon: obscureText
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: onPasswordVisibilityChanged,
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              hintStyle: TextStyle(
                color: AppColors.secondaryColor.shade800,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.secondaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.secondaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
