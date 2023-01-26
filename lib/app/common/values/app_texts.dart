import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:icp_gahara_mobile/app/common/values/app_colors.dart';

abstract class AppTexts {
  static TextStyle primaryH1Bold = TextStyle(
    color: AppColors.secondaryColor.shade900,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 37.0.sp,
  );

  static TextStyle primaryH1Regular = TextStyle(
    color: AppColors.secondaryColor.shade900,
    fontStyle: FontStyle.normal,
    fontSize: 37.0.sp,
  );

  static TextStyle primaryPRegular = TextStyle(
    color: AppColors.secondaryColor.shade900,
    fontStyle: FontStyle.normal,
    fontSize: 14.0.sp,
  );

  static TextStyle primaryPBold = TextStyle(
    color: AppColors.secondaryColor.shade900,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 14.0.sp,
  );
}
