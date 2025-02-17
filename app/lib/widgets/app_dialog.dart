// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/shareds/utils/app_colors.dart';

import 'app_styles.dart';

/// Modal types
enum DialogType { error, success, warning, info, neutral }

const subTitleContent = 'We have you in mind. In the main time, explore the available features. Thank you.';

class _AppDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final DialogType type;
  final double height;
  final List<DialogButton>? actions;

  const _AppDialog({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.height,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationCurve: Curves.easeInOut,
      backgroundColor: Colors.transparent,
      child: WillPopScope(
        onWillPop: () async => true,
        child: Container(
          padding: const EdgeInsets.all(16),
          height: height,
          decoration: BoxDecoration(
            color: type == DialogType.success
                ? dialogSuccessBackground
                : type == DialogType.neutral
                    ? background
                    : type == DialogType.info
                        ? dialogInfoBackground
                        : type == DialogType.error
                            ? dialogErrorBackground
                            : dialogWarningBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: type == DialogType.success
                  ? dialogSuccessBorder
                  : type == DialogType.neutral
                      ? Colors.grey
                      : type == DialogType.info
                          ? line
                          : type == DialogType.error
                              ? dialogErrorBorder
                              : dialogWarningBorder,
              width: 2.0,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(
                      size: 24,
                      Icons.info_outline,
                      color: type == DialogType.success
                          ? dialogSuccessBorder
                          : type == DialogType.success
                              ? Colors.grey
                              : type == DialogType.info
                                  ? line
                                  : type == DialogType.error
                                      ? dialogErrorBorder
                                      : dialogWarningBorder,
                    ),
                  ),
                  Text(
                    title,
                    style: appStyles(18, Colors.black, FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                subtitle,
                style: appStyles(16, Colors.black, null),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions == null
                    ? []
                    : actions!
                        .map((e) => TextButton(
                            onPressed: e.onTap,
                            child: Text(
                              e.label,
                              style: appStyles(null, primaryColor, null),
                            )).paddingSymmetric(horizontal: 8))
                        .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DialogButton {
  final String label;
  final VoidCallback onTap;

  DialogButton({
    required this.label,
    required this.onTap,
  });
}

Future<T?> showAppDialog<T>({
  DialogType type = DialogType.neutral,
  double height = 150,
  required String title,
  required String subtitle,
  List<DialogButton>? actions,
}) {
  return Get.dialog(
    _AppDialog(
      height: height,
      title: title,
      subtitle: subtitle,
      type: type,
      actions: actions,
    ),
    transitionCurve: Curves.easeInOut,
  );
}

Future<dynamic> placeholderDialog(String pageTitle) {
  return showAppDialog(
    title: pageTitle,
    subtitle: subTitleContent,
    type: DialogType.warning,
  );
}

void placeHolderDialog(String pageTitle) {
  showAppDialog(
    title: pageTitle,
    subtitle: subTitleContent,
    type: DialogType.warning,
  );
}
