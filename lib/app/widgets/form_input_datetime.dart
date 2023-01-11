import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import '../common/values/app_colors.dart';
import '../common/values/app_texts.dart';

class FormInputDateTime extends StatelessWidget {
  const FormInputDateTime({
    super.key,
    this.prefixIcon,
    required this.hintText,
    required this.labelText,
    this.isRequired = false,
    this.textInputAction,
    this.controller,
    this.firstDate,
    this.lastDate,
    this.enabled = true,
    this.onChange,
    this.initialDate,
  });
  final Icon? prefixIcon;
  final String hintText;
  final String labelText;
  final bool? isRequired;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final bool enabled;
  final Function(String)? onChange;

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
          DateTimePicker(
            enabled: enabled,
            initialDate: initialDate,
            controller: controller,
            firstDate: firstDate,
            lastDate: lastDate,
            dateLabelText: 'Date',
            onChanged: onChange,
            validator: (value) {
              if (isRequired!) {
                if (value!.isEmpty) {
                  return 'Field ini tidak boleh kosong';
                }
              }
              return null;
            },
            textInputAction: textInputAction,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              hintText: hintText,
              fillColor: AppColors.secondaryColor,
              filled: true,
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
