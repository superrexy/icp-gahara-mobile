import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';
import 'package:icp_gahara_mobile/app/common/values/app_images.dart';
import 'package:icp_gahara_mobile/app/common/values/app_texts.dart';

class SpesificationCarItem extends StatelessWidget {
  const SpesificationCarItem({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.shade600,
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.all(6),
            child: imagePath.contains('.svg')
                ? SvgPicture.asset(imagePath)
                : Image.asset(imagePath),
          ),
          const SizedBox(
            width: 8,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 50),
            child: FittedBox(
              child: Text(
                title,
                style: AppTexts.primaryPRegular.copyWith(
                  fontSize: 14,
                  color: AppColors.secondaryColor.shade900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
