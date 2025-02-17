import 'package:app/widgets/app_styles.dart';
import 'package:app/widgets/empty_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../shareds/utils/app_colors.dart';
import '../../shareds/utils/images.dart';

class BillsTabScreen extends StatelessWidget {
  const BillsTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryColor,
          statusBarBrightness: Brightness.light, // For iOS
          statusBarIconBrightness: Brightness.light, // For Android
          systemNavigationBarColor: navigationBarBackground,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        backgroundColor: background,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          'Bills',
          style: appStyles(18, titleActive, FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset(notificationIcon),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
      body: const EmptyPlaceholder(),
    );
  }
}
