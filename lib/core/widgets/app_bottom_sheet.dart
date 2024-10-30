import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

Future<T?> showAppBottomSheet<T>(BuildContext context,
    {required Widget Function(BuildContext) builder,
    bool showCloseButton = false}) async {
  return await showModalBottomSheet<T?>(
    context: context,
    backgroundColor: AppColors.primaryColor,
    isDismissible: false,
    enableDrag: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
    ),
    builder: (context) {
      return PopScope(
        canPop: false,
        child: Container(
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/Mask.png"),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(20),
              color: AppColors.secondaryColor),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showCloseButton)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          color: AppColors.thirdColor,
                        ),
                      ),
                    ),
                  ),
                builder(context)
              ],
            ),
          ),
        ),
      );
    },
  );
}
